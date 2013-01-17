//
//  ViewController.h
//  ios20121017_sync_async_network
//
//  Created by sdt5 on 10/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDataDelegate>
- (IBAction)handleSync:(id)sender;
- (IBAction)handleAsync:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageiew;

@end
