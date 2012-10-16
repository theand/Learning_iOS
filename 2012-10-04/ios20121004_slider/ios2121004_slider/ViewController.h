//
//  ViewController.h
//  ios2121004_slider
//
//  Created by sdt5 on 12. 10. 4..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)handleMove:(id)sender;
- (IBAction)handleHide:(id)sender;
- (IBAction)handleSelected:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *upperImage;
@property (weak, nonatomic) IBOutlet UIImageView *belowImage;

@end
