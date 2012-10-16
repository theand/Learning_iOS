//
//  ViewController.h
//  ios20121004_homework_slider
//
//  Created by sdt5 on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

/* 아이폰 고급 과정 - 채희상 
 과제 #1 
 제출일. 2012.10.08 월.
 */

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)handleArrow:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *sliderMainImageView;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end
