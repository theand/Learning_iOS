//
//  ViewController.h
//  ios20121025_local_noti
//
//  Created by sdt5 on 10/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)notiNow:(id)sender;
- (IBAction)noti7Sec:(id)sender;
- (IBAction)notiFire:(id)sender;

@end