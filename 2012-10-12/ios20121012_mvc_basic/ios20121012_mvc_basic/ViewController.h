//
//  ViewController.h
//  ios20121012_mvc_basic
//
//  Created by sdt5 on 10/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *productNameField;
-(IBAction) addNewPrduct:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *theTable;

@end
