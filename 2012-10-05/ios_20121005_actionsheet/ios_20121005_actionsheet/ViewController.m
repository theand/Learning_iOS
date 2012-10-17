//
//  ViewController.m
//  ios_20121005_actionsheet
//
//  Created by sdt5 on 10/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIActionSheetDelegate>

@end

@implementation ViewController
int count=0;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

- (IBAction)handleActionSheet:(id)sender {
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"ActonSheet" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Destructive" otherButtonTitles:@"Opt1", @"Opt2", nil];
    as.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [as showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"clicked %d - %@", buttonIndex, [actionSheet buttonTitleAtIndex:buttonIndex]);
}

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet {
    NSString *title = [[NSString alloc] initWithFormat:@"%dth attempt", count++];
    [actionSheet setTitle:title];
}
@end
