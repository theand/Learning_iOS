//
//  ViewController.m
//  ios2121004_slider
//
//  Created by sdt5 on 12. 10. 4..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize upperImage;
@synthesize belowImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setUpperImage:nil];
    [self setBelowImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)handleMove:(id)sender {
    CGPoint p = upperImage.center;
    upperImage.center = belowImage.center;
    belowImage.center = p;
}

- (IBAction)handleHide:(id)sender {
    upperImage.hidden = !    upperImage.hidden;
    belowImage.hidden = !    belowImage.hidden;
    if( upperImage.hidden == YES ){
        [sender setTitle:@"Show" forState:UIControlStateNormal];
    }else{
        [sender setTitle:@"Hide" forState:UIControlStateNormal];
    }
}

- (IBAction)handleSelected:(id)sender {
    UIButton * b = (UIButton *) sender;
    b.selected = !b.selected; 
}
@end
