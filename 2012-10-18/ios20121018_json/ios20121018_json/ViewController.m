//
//  ViewController.m
//  ios20121018_json
//
//  Created by sdt5 on 10/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Movie.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray * movieList;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    movieList = [[NSMutableArray alloc] init];

    [self parseJson];
}

- (void)parseJson {
    __autoreleasing NSError *error   = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"movie" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    NSArray *itemList = [dict objectForKey:@"item"];
    for (NSDictionary *i in itemList){
        Movie *mov = [[Movie alloc] init];
        mov.title = [i objectForKey:@"title"];
        NSLog(@"Title :%@", mov.title);
        [movieList addObject:mov];
    }

    NSLog(@"movieList: %@", movieList);

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

@end
