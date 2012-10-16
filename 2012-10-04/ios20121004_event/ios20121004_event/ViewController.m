//
//  ViewController.m
//  ios20121004_event
//
//  Created by sdt5 on 12. 10. 4..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    UIButton *btnX;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"BTN2" forState:UIControlStateNormal];
    btn.frame = CGRectMake(150, 350, 100, 20 );

    [self.view addSubview:btn];
//    [btn addTarget:self action:@selector(handleTouch2:) forControlEvents:UIControlEventTouchUpInside];

    btnX = [UIButton buttonWithType:UIButtonTypeRoundedRect];


    [btnX setTitle:@"Normal" forState:UIControlStateNormal];
    [btnX setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [btnX setTitle:@"Highlighted" forState:UIControlStateHighlighted];
    [btnX setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];

    [btnX setTitle:@"Selected" forState:UIControlStateSelected];
    [btnX setTitleColor:[UIColor redColor] forState:UIControlStateSelected];

    [btnX setTitle:@"Disabled" forState:UIControlStateDisabled];
    [btnX setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];

    btnX.frame = CGRectMake(14, 20, 178, 127);
    [self.view addSubview:btnX];
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

//-(IBAction) handleTouch2:(id) sender{
//    NSLog(@"handleTouchBigButton: %@", sender);
//}

-(IBAction)toggleHighlighted:(id)sender{
    NSLog(@"toggleHighlighted - before: %d", btnX.state);
    btnX.highlighted = !btnX.highlighted;
    NSLog(@"toggleHighlighted - after: %d", btnX.state);
}


-(IBAction)toggleSelected:(id)sender{
    NSLog(@"toggleSelected - before: %d", btnX.buttonType);
    btnX.selected = !btnX.selected;
    NSLog(@"toggleSelected - after: %d", btnX.state);
}
-(IBAction)toggleDisabled:(id)sender{
    NSLog(@"toggleDisabled - before: %d", btnX.buttonType);
    btnX.enabled = !btnX.enabled;
    NSLog(@"toggleDisabled - after: %d", btnX.state);
}

@end
