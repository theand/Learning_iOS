//
//  ViewController.m
//  ios20121009_tableview
//
//  Created by sdt5 on 10/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray *data[2];
    UITableViewCellEditingStyle editMode;
    NSIndexPath *indexP;
}
@synthesize editButton;
@synthesize addButton;
@synthesize theTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    data[0] = [[NSMutableArray alloc] initWithObjects:@"item1", @"item2", @"item3", @"item4", @"item5", @"item6", @"item7", @"item8", @"item9", @"item10", @"item11", @"item12", nil];
    data[1] = [[NSMutableArray alloc] initWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", nil];
    editMode = UITableViewCellEditingStyleDelete;
}

- (void)viewDidUnload {
    [self setTheTable:nil];
    [self setEditButton:nil];
    [self setAddButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [data[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;

    cell = [tableView dequeueReusableCellWithIdentifier:CELL1];

    switch (indexPath.row % 3) {
        case 0:
            cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
            break;
        case 1:
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            break;
        case 2:
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
    }

    cell.textLabel.text = [data[indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"AccTapped: section %d / row %d", indexPath.section, indexPath.row);
    NSLog(@"AccTapped: Selected: %@", [data[indexPath.section] objectAtIndex:indexPath.row]);


//    cell.textLabel.text = [data[indexPath.section] objectAtIndex:indexPath.row];
// TODO :  다시 그리는 시점은 언제인가?
//  TODO :  임의 시점에  cell  에 접근해서( section, row 를 임의 지정) 데이터를 바꾸면, 언제 다시 그려지지?
//  TODO :   cell 의 정보( text, accessoryType  등)를 임의접근할 수 있나?
//  row 1 을 터치하면,  row 2 의 속성을 바뀌게 한다든지.



}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Commit");

    if (editingStyle == UITableViewCellEditingStyleDelete) {

        [data[indexPath.section] removeObjectAtIndex:indexPath.row];

        NSArray *rows = [NSArray arrayWithObject:indexPath];
        [tableView deleteRowsAtIndexPaths:rows withRowAnimation:UITableViewRowAnimationAutomatic];
        NSLog(@"Data: %@", data[indexPath.section]);
    } else {
        indexP = indexPath;

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"추가" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        [alert show];
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"CellSelected: %d, %d", indexPath.section, indexPath.row);
    NSLog(@"CellSelected: Selected: %@", [data[indexPath.section] objectAtIndex:indexPath.row]);

}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title[2];
    title[0] = [[NSString alloc] initWithFormat:@"Section Header : %d", section];
    title[1] = [[NSString alloc] initWithFormat:@"Section Header : %d", section];

    return title[section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"End of setion";
}

- (IBAction)toggleTableEditing:(id)sender {

    editMode = UITableViewCellEditingStyleDelete;
    if (theTable.editing) {
        addButton.enabled = YES;
        NSLog(@"DefaultMode");
    } else {
        addButton.enabled = NO;
        NSLog(@"DeleteMode");
        editMode = UITableViewCellEditingStyleDelete;
    }
    theTable.editing = !theTable.editing;

    NSLog(@"ToggleEdit : %d", editMode);
}

- (IBAction)toggleTableAdd:(id)sender {
    editMode = UITableViewCellEditingStyleDelete;
    if (theTable.editing) {
        editButton.enabled = YES;
        NSLog(@"DefaultMode");
    } else {
        editButton.enabled = NO;
        NSLog(@"InsertMode");
        editMode = UITableViewCellEditingStyleInsert;
    }
    theTable.editing = !theTable.editing;
    NSLog(@"ToggleAdd : %d", editMode);
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCellEditingStyle result = editMode;
    NSLog(@"editingStyleForRowAtIndexPath : %d", editMode);
    return result;
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView {
    return [[alertView textFieldAtIndex:0].text length] > 0;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == alertView.firstOtherButtonIndex) {
        [data[indexP.section] insertObject:[alertView textFieldAtIndex:0].text atIndex:indexP.row];
        [theTable insertRowsAtIndexPaths:[NSArray arrayWithObject:indexP] withRowAnimation:UITableViewRowAnimationAutomatic];
        NSLog(@"Data: %@", data[indexP.section]);
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    id obj = [data[sourceIndexPath.section] objectAtIndex:sourceIndexPath.row];
    [data[sourceIndexPath.section] removeObjectAtIndex:sourceIndexPath.row];
    [data[sourceIndexPath.section] insertObject:obj atIndex:destinationIndexPath.row];

    NSLog(@"moved: %@", data[sourceIndexPath.section]);

}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

@end
