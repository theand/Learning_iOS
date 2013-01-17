//
//  ViewController.m
//  ios20121012_mvc_basic
//
//  Created by sdt5 on 10/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize theTable;

@synthesize  productNameField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload {
    [self setTheTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[Model getSharedModel] numberOfProducts];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    cell.textLabel.text = [[Model getSharedModel] productAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [[Model getSharedModel] removeProductAtIndex:indexPath.row];
    NSArray *rows = [NSArray arrayWithObject:indexPath];
    [tableView deleteRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (IBAction)addNewPrduct:(id)sender {
    Model *m = [Model getSharedModel];
    NSString *name = productNameField.text;
    [m addProduct:name];

    NSIndexPath *p = [NSIndexPath indexPathForRow:[m numberOfProducts]-1 inSection:0];
    NSArray *rows = [NSArray arrayWithObject:p];
    [theTable insertRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationAutomatic];

    [productNameField setText:@""];
    [productNameField resignFirstResponder];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

@end
