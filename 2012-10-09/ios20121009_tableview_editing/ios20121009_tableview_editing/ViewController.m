//
//  ViewController.m
//  ios20121009_tableview_editing
//
//  Created by sdt5 on 10/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray *data;
}
@synthesize theTextField;
@synthesize theAddButton;
@synthesize theEditDoneButton;
@synthesize theTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    data = [[NSMutableArray alloc] initWithObjects:@"item1", @"item2", @"item3", nil];
}

- (void)viewDidUnload {
    [self setTheTextField:nil];
    [self setTheAddButton:nil];
    [self setTheEditDoneButton:nil];
    [self setTheTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (IBAction)handleTextField:(id)sender {
}

- (IBAction)handleEditDoneButton:(id)sender {

    if (theTable.editing) {
        [theEditDoneButton setTitle:@"Edit"];
        NSLog(@"DONE");
    } else {
        [theEditDoneButton setTitle:@"Done"];
        NSLog(@"EDIT");
    }
    theTable.editing = !theTable.editing;
}

- (IBAction)handleAddButton:(id)sender {
    NSString *msg = theTextField.text;
    if([msg length] >0 ){
        [data insertObject:msg atIndex:0];
        theTextField.text = @"";
        NSIndexPath *p = [NSIndexPath indexPathForRow:0 inSection:0];
        NSArray *rows = [NSArray arrayWithObject:p];
        [theTable insertRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationAutomatic];
        NSLog(@"Data : %@", data);
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [data count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    cell.textLabel.text = [data objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    [data removeObjectAtIndex:indexPath.row];
    NSArray *rows = [NSArray arrayWithObject:indexPath];
    [tableView deleteRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationAutomatic];
    NSLog(@"Data : %@", data);
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    id obj = [data objectAtIndex:sourceIndexPath.row];
    [data removeObjectAtIndex:sourceIndexPath.row];
    [data insertObject:obj atIndex:destinationIndexPath.row];
    NSLog(@"Data : %@", data);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self handleAddButton:nil];
    return YES;
}

@end
