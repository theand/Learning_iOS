//
//  ViewController.m
//  ios20121005_alert
//
//  Created by sdt5 on 12. 10. 5..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>

@end

@implementation ViewController

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

- (IBAction)handleBasicAlert:(id)sender {
    UIAlertView *basic = [[UIAlertView alloc] initWithTitle:@"Basic" message:@"This is message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Select A", @"Select B", nil];
    basic.tag = 1;
    [basic show] ;
}

- (IBAction)handleAlertWithInput:(id)sender {
    UIAlertView *input = [[UIAlertView alloc] initWithTitle:@"Login" message:@"Please input" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    input.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    input.tag = 2;
    [input show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if( alertView.tag == 1){
        NSLog(@"alertView.text : %@", [alertView buttonTitleAtIndex:buttonIndex]);
    }else{
        if ( alertView.firstOtherButtonIndex == buttonIndex)
           NSLog(@"INPUT: id - %@ / pw - %@", [alertView textFieldAtIndex:0].text, [alertView textFieldAtIndex:1].text);
    }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView {
    if( alertView.tag == 2){
        return [[alertView textFieldAtIndex:0].text length]>3 && [[alertView textFieldAtIndex:1].text length]>3;
    }

    return YES;

}
@end
