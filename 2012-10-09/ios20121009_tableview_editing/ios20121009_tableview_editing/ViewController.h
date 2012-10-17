//
//  ViewController.h
//  ios20121009_tableview_editing
//
//  Created by sdt5 on 10/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *theTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *theAddButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *theEditDoneButton;
@property (weak, nonatomic) IBOutlet UITableView *theTable;

- (IBAction)handleTextField:(id)sender;
- (IBAction)handleEditDoneButton:(id)sender;
- (IBAction)handleAddButton:(id)sender;

@end
