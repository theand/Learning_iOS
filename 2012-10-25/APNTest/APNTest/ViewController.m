//
//  ViewController.m
//  APNTest
//
//  Created by sdt5 on 10/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, NSXMLParserDelegate, UIAlertViewDelegate> {
    NSArray *friendList;
    int selectedRow;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)viewWillAppear:(BOOL)animated {
    [self parseFriendList];
}

- (void)parseFriendList {
    NSURL *url = [NSURL URLWithString:@"http://192.168.203.133:3000/friend_list.json"];
    NSData *data = [NSData dataWithContentsOfURL:url];

    __autoreleasing NSError *error = nil;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    friendList = [result objectForKey:@"friends"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [friendList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"USER_CELL"];
    NSDictionary *one = [friendList objectAtIndex:indexPath.row];
    cell.textLabel.text = [one objectForKey:@"name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"알림" message:@"메시지" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    selectedRow = indexPath.row;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.firstOtherButtonIndex != buttonIndex) {
        return;
    }

    NSString *msg = [alertView textFieldAtIndex:0].text;
    NSString *name = [[friendList objectAtIndex:selectedRow] objectForKey:@"name"];
    NSString *urlStr = [NSString stringWithFormat:@"http://192.168.203.133:3000/?msg=%@&name=%@", msg, name];

    DebugLog(@"urlStr: %@", urlStr);

    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];

    __autoreleasing NSError *error = nil;

    NSURLResponse *response = nil;
    NSData *result = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&error];
    NSString *resultStr = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];

    DebugLog(@"Result: %@", resultStr);

}


@end
