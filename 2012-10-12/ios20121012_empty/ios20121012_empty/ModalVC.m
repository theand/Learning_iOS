//
//  ModalVC.m
//  ios20121012_empty
//
//  Created by sdt5 on 12. 10. 12..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "ModalVC.h"
#import "ViewController.h"

@implementation ModalVC
@synthesize messageField;
@synthesize msg;

- (IBAction)closeModalVC:(id)sender {
    ViewController *vc = (ViewController *) self.presentingViewController;
    vc.messageField.text = messageField.text;
    [self dismissModalViewControllerAnimated:YES];
}
- (void)viewDidUnload {
    [self setMessageField:nil];
    [super viewDidUnload];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [messageField resignFirstResponder];
    return YES;
}


//TODO did로 바꾸면 뭔가 작동이 이상함.
- (void)viewWillAppear:(BOOL)animated{
    messageField.text = msg;
}

-(void) viewWillDisappear:(BOOL)animated   {
    [messageField resignFirstResponder];
    [super viewWillDisappear:animated];
}

@end
