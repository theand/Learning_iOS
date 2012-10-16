//
//  ViewController.m
//  ios20121004_hello
//
//  Created by sdt5 on 12. 10. 4..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@synthesize IBOutlet UIView view2;
//@synthesize IBOutlet UILabel label;

@property (strong, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

@synthesize label;

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    NSLog(@"didRotate");
    if( UIInterfaceOrientationIsLandscape([UIDevice currentDevice].orientation)){
        label.text = @"landscape";
    }else {
        label.text = @"horizontal";
    }
//    NSLog(@"rotate label : %@", label.text);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    
    NSLog(@"before alloc label : %@", label);
    
//    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
//    redView.backgroundColor = [UIColor redColor];
//    redView.alpha = 0.5;
//    [self.view addSubview:redView];
//    
//    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(100, 80, 200, 200)];
//    blueView.backgroundColor = [UIColor blueColor];
//    blueView.alpha = 0.5;
//    [self.view addSubview:blueView];
//    
//    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(50, 80, 200, 200)];
//    greenView.backgroundColor = [UIColor greenColor];
//    greenView.alpha = 0.5;
//    [self.view addSubview:greenView];
                       
    label = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 250, 60)]; // 얘를 주석해제하면, 라벨이 두개 생김.
    [self.view addSubview:label];
    UIFont *font = [UIFont fontWithName:@"Marker Felt" size:24];
    label.font = font;
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"Default";
    NSLog(@"init label : %@", label);
    
    NSLog(@"orientation : %@", NSStringFromCGRect(label.frame));
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"viewWillAppear");
//    NSLog(@"rect: %@", NSStringFromCGRect(self.view.frame));
//    self.view.backgroundColor = [UIColor blueColor];
    
//    UILabel *label = [self.view viewWithTag:99];
//    NSLog(@"label : %@", label.text);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
//        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
//    } else {
//        return YES;
//    }
    return YES;
}

@end
