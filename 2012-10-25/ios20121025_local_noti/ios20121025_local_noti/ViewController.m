//
//  ViewController.m
//  ios20121025_local_noti
//
//  Created by sdt5 on 10/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize datePicker;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDatePicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)notiNow:(id)sender {
    UILocalNotification *noti = [[UILocalNotification alloc] init];
    noti.alertBody = @" 노티 테스트 ";
    noti.alertAction = @"Close";

    [[UIApplication sharedApplication] presentLocalNotificationNow:noti];
}


- (IBAction)noti7Sec:(id)sender {
    UILocalNotification *noti = [[UILocalNotification alloc] init];
    noti.fireDate = [NSDate dateWithTimeIntervalSinceNow:7];
    noti.alertBody = @" 7 seconds ";
    noti.alertAction = @"Close";
    noti.soundName = UILocalNotificationDefaultSoundName;

    [[UIApplication sharedApplication] scheduleLocalNotification:noti];


}

- (IBAction)notiFire:(id)sender {
    UILocalNotification *noti = [[UILocalNotification alloc] init];
    noti.fireDate = datePicker.date;
    noti.alertBody = @" Picker ";
    noti.alertAction = @"Close";
    noti.soundName = UILocalNotificationDefaultSoundName;

    noti.userInfo = [NSDictionary dictionaryWithObject:@"obj" forKey:@"key"];
    [[UIApplication sharedApplication] scheduleLocalNotification:noti];

}
@end
