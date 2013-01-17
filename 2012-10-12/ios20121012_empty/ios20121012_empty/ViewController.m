//
//  ViewController.m
//  ios20121012_empty
//
//  Created by sdt5 on 12. 10. 12..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "ModalVC.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize messageField;
@synthesize msg;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//TODO 왜 appear이지? disappear아닌가?
- (void)viewDidAppear:(BOOL)animated{
    [messageField resignFirstResponder];
    [super viewDidAppear:animated];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if( [@"Segue1" isEqualToString:segue.identifier] ){
        ModalVC *vc = segue.destinationViewController;
        vc.msg = messageField.text;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setMessageField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 
- (IBAction)showModal2:(id)sender {
    [self performSegueWithIdentifier:@"Segue1" sender:sender];
}

- (IBAction)showModal3:(id)sender {
    UIStoryboard *board = self.storyboard;
    ModalVC *vc = (ModalVC *) [board instantiateViewControllerWithIdentifier:@"ModalVC"];
    vc.msg = messageField.text;
    [self presentModalViewController:vc animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [messageField resignFirstResponder];
    return YES;
}
@end
