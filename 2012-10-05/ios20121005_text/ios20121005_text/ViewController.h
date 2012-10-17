//
//  ViewController.h
//  ios20121005_text
//
//  Created by sdt5 on 12. 10. 5..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tf1;
@property (weak, nonatomic) IBOutlet UITextField *tf2;
@property (weak, nonatomic) IBOutlet UITextField *tf3;
@property (weak, nonatomic) IBOutlet UITextField *tf4;
@property (weak, nonatomic) IBOutlet UIButton *overlay;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
- (IBAction)handleDone:(id)sender;


@end
