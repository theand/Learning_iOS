//
//  ViewController.h
//  ios20121008_imageviewpicker
//
//  Created by sdt5 on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
- (IBAction)randomTouched:(id)sender;

@end
