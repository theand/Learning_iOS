//
//  ViewController.m
//  ios20121017_concurrent_image
//
//  Created by sdt5 on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"


@interface ViewController ()<NSXMLParserDelegate, UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController{
    NSMutableArray *appList;
    NSMutableString *buffer;
    BOOL insideTag;
    AppInfo *currentApp;
    NSDictionary *dict;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    appList = [[NSMutableArray alloc] init];
    buffer = [[NSMutableString alloc] init];

    NSArray *obj = [[NSArray alloc] initWithObjects:@"title", @"imagePath",  nil];
    NSArray *key = [[NSArray alloc] initWithArray:obj];
    dict = [[NSDictionary alloc] initWithObjects:obj forKeys:key];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void)parserDidStartDocument:(NSXMLParser *)parser {

}

- (void)parserDidEndDocument:(NSXMLParser *)parser {


}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [appList count];
}


@end
