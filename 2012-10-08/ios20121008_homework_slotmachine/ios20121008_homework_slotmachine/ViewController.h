//
//  ViewController.h
//  ios20121008_homework_slotmachine
//
//  Created by sdt5 on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startTouched:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *bettingField;
@property (weak, nonatomic) IBOutlet UITextField *currentField;

@end
