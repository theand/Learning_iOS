//
//  ViewController.m
//  ios20121004_homework_slider
//
//  Created by sdt5 on 10/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

/* 아이폰 고급 과정 - 채희상 
    과제 #1 
    제출일. 2012.10.08 월.
 */

#import "ViewController.h"

const int numOfImages = 5;
int slideIndex=0;
UIImage *images[5];
enum {
    LEFT_ARROW = 1,
    RIGHT_ARROW = 2
} ARROW_TAG;

@interface ViewController ()

@end

@implementation ViewController {


}
@synthesize sliderMainImageView;
@synthesize leftButton;
@synthesize rightButton;

- (void)viewDidLoad {
    [super viewDidLoad];

    for (int i = 0; i < numOfImages; i++) {
        NSString *name = [[NSString alloc] initWithFormat:@"image%d", i];
        NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"jpg"];
        images[i] = [UIImage imageWithContentsOfFile:path];
    }

    sliderMainImageView.image = images[slideIndex]; // equal 0
    leftButton.enabled = NO;
    NSLog(@"image: %d", slideIndex);

}

- (void)viewDidUnload {
    [self setSliderMainImageView:nil];
    [self setLeftButton:nil];
    [self setRightButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {

    NSLog(@"left : %@", leftButton);
    NSLog(@"right : %@", rightButton);

    if (UIInterfaceOrientationIsLandscape([UIDevice currentDevice].orientation)){
        NSLog(@"landscape");
    }else{
        NSLog(@"portrait");
    }

}
- (IBAction)handleArrow:(id)sender {
    if ([sender tag] == LEFT_ARROW) {
        [self slideToLeft:sender];
    } else {
        [self slideToRight:sender];
    }
    NSLog(@"handleArrow : %@", sliderMainImageView);
}


- (void)slideToLeft:(id)sender {
    UIButton *b = (UIButton *) sender;

    if (slideIndex > 0) { //equal 1,2,3,4
        slideIndex--;
    }

    if (slideIndex == 0) {//  equal 0
        b.enabled = NO;
    }

    if( rightButton.enabled == NO )
        rightButton.enabled = YES;

    sliderMainImageView.image = images[slideIndex];
    NSLog(@"image to left: %d", slideIndex);
}

- (void)slideToRight:(id)sender {
    UIButton *b = (UIButton *) sender;

    if (slideIndex < (numOfImages - 1)) { // equal 0,1,2,3
        slideIndex++;
    }

    if (slideIndex == (numOfImages - 1)) {//  equal 4
        b.enabled = NO;
    }

    if( leftButton.enabled == NO )
        leftButton.enabled = YES;

    sliderMainImageView.image = images[slideIndex];
    NSLog(@"image to right: %d", slideIndex);
}


@end
