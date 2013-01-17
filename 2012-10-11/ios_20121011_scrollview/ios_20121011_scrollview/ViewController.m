//
//  ViewController.m
//  ios_20121011_scrollview
//
//  Created by sdt5 on 10/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    UIImageView *imageView;
}
@synthesize scrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bluemarble2k_big.jpeg"]];
    [scrollView addSubview:imageView];
    [scrollView setContentSize:imageView.frame.size];
    scrollView.minimumZoomScale = scrollView.frame.size.width / imageView.frame.size.width;
    scrollView.maximumZoomScale = 2.0;
    scrollView.delegate = self;

//    float x = scrollView.contentOffset.x;
//    float y = scrollView.contentOffset.y;
//    float w = /*scrollView.frame.size.width / */imageView.frame.size.width;
//    float h = /*scrollView.frame.size.height /*/ imageView.frame.size.height;
//    CGRect r = CGRectMake(x, y, w, h);
//    [scrollView zoomToRect:r animated:YES];
    [scrollView setZoomScale:scrollView.frame.size.width/imageView.frame.size.width animated:YES];
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView1 {
    return imageView;
}

@end
