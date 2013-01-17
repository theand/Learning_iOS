//
//  SecondVC.m
//  ios20121015_tabbar_basic
//
//  Created by sdt5 on 12. 10. 15..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "SecondVC.h"
#import "AppDelegate.h"

@interface SecondVC ()

@end

@implementation SecondVC
@synthesize textField;

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
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
