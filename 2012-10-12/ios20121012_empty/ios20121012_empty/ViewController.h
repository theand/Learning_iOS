//
//  ViewController.h
//  ios20121012_empty
//
//  Created by sdt5 on 12. 10. 12..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
- (IBAction)showModal2:(id)sender;
- (IBAction)showModal3:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *messageField;
@property (weak, nonatomic) NSString *msg;

@end
