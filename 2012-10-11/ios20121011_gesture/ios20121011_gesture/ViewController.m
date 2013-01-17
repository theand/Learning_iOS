//
//  ViewController.m
//  ios20121011_gesture
//
//  Created by sdt5 on 10/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)gesture {
    NSLog(@"handlePinch");

}

-(IBAction)handleTap:(UITapGestureRecognizer *)gesture{
    CGPoint point = [gesture locationInView:self.view];
    NSLog(@"handleTap : %f, %f", point.x, point.y);
}

@end
