//
//  ViewController.h
//  ios20121009_tableview
//
//  Created by sdt5 on 10/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CELL1 @"cellid1"
#define CELL2 @"cellid2"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *theTable;
- (IBAction)toggleTableEditing:(id)sender;
- (IBAction)toggleTableAdd:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@end
