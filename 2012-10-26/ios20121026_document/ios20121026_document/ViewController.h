//
//  ViewController.h
//  ios20121026_document
//
//  Created by sdt5 on 10/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)saveHandler:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *theTextView;

@end