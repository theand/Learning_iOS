//
//  ViewController.m
//  ios20121005_rgb_slider
//
//  Created by sdt5 on 12. 10. 5..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize colorSwitch;
@synthesize sliderRed;
@synthesize sliderGreen;
@synthesize sliderBlue;
@synthesize theIndicator;
@synthesize colorArea;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    theIndicator.hidesWhenStopped = YES;
    [theIndicator stopAnimating];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self changeColorArea];
    NSLog(@"viewWillAppear");

}
- (void)viewDidUnload
{
    [self setColorSwitch:nil];
    [self setSliderRed:nil];
    [self setSliderGreen:nil];
    [self setSliderBlue:nil];
    [self setTheIndicator:nil];
    [self setColorArea:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)handleSwitch:(id)sender {
    UISwitch *sw = (UISwitch *)sender;
    if( sw.on == YES){
        [theIndicator startAnimating];
        [theIndicator performSelector:@selector(stopAnimating) withObject:nil afterDelay:1.0];
        [self changeColorArea];
    }   else{
        colorArea.backgroundColor = [UIColor grayColor] ;
    }
    sliderRed.enabled = sw.on;
    sliderGreen.enabled = sw.on;
    sliderBlue.enabled = sw.on;
}

- (IBAction)handleSlider:(id)sender {
    [self changeColorArea];
}

- (void)changeColorArea {
    colorArea.backgroundColor = [UIColor colorWithRed:sliderRed.value green:sliderGreen.value blue:sliderBlue.value alpha:1.0];
}

@end
