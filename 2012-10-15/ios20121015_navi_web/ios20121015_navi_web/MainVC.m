//
//  MainVC.m
//  ios20121015_navi_web
//
//  Created by sdt5 on 12. 10. 15..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

//TODO   테이블 뷰 표시 안됨.

#import "MainVC.h"

@interface MainVC (){
    NSString *url[4];
}
@end

@implementation MainVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    url[0] = @"http://apple.com";
    url[1] = @"http://google.com";
    url[2] = @"http://daum.net";
    url[3] = @"http://naver.com";

	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:@"URLCELL"];
    cell.textLabel.text = url[indexPath.row];
    NSLog(@"text : %@",  cell.textLabel.text);
    return cell;
}


@end
