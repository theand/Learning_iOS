//
//  ViewController.h
//  ios20121012_mvc_catalog
//
//  Created by sdt5 on 10/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartDelegate.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, CartDelegate>

@property (weak, nonatomic) IBOutlet UITableView *theTable;

@end
