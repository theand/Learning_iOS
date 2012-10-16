//
//  ViewController.m
//  ios20121004_imageview
//
//  Created by sdt5 on 12. 10. 4..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    UIImage *img1 = [UIImage imageNamed:@"baseball.jpg"];
    UIImage *img1h = [UIImage imageNamed:@"baseball2.jpg"];
    
    UIImageView *iv1 = [[UIImageView alloc] initWithImage:img1 highlightedImage:img1h];
    iv1.frame = CGRectMake(50, 200, 100, 100);
    [self.view addSubview:iv1];
    iv1.highlighted = YES;
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"baseball" ofType:@"jpg"];
    NSString *filePath2 = [[NSBundle mainBundle] pathForResource:@"baseball2" ofType:@"jpg"];
    NSLog(@"%@", filePath);
    UIImage *img2 = [UIImage imageWithContentsOfFile:filePath];
    UIImage *img2h = [UIImage imageWithContentsOfFile:filePath2];
    UIImageView *iv2 = [[UIImageView alloc] initWithImage:img2 highlightedImage:img2h];
    iv2.frame = CGRectMake(50, 350, 200, 200);
    iv2.highlighted = YES;
    [self.view addSubview:iv2];
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

@end
