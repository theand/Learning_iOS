//
//  ViewController.m
//  ios20121015_tabbar_basic
//
//  Created by sdt5 on 12. 10. 15..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField1 {
    [textField1 resignFirstResponder];
    return YES;
}

- (void)viewDidAppear:(BOOL)animated {
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    self.textField.text = delegate.data;
}

- (void)viewDidDisappear:(BOOL)animated {
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    delegate.data = self.textField.text;
}
@end
