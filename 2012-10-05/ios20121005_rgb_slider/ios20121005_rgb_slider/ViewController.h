//
//  ViewController.h
//  ios20121005_rgb_slider
//
//  Created by sdt5 on 12. 10. 5..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *colorSwitch;
@property (weak, nonatomic) IBOutlet UISlider *sliderRed;
@property (weak, nonatomic) IBOutlet UISlider *sliderGreen;
@property (weak, nonatomic) IBOutlet UISlider *sliderBlue;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *theIndicator;
@property (weak, nonatomic) IBOutlet UIView *colorArea;
- (IBAction)handleSwitch:(id)sender;
- (IBAction)handleSlider:(id)sender;

@end
