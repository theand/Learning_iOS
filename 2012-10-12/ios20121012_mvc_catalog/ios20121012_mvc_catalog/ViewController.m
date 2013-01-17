//
//  ViewController.m
//  ios20121012_mvc_catalog
//
//  Created by sdt5 on 10/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "Catalog.h"
#import "ProductCell.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSMutableArray *theCart;
}
@synthesize theTable;

- (void)viewDidLoad
{
    [super viewDidLoad];
    theCart = [[NSMutableArray alloc] init];
}

- (void)viewDidUnload
{
    [self setTheTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)addItemToCart:(id)sender {
    NSIndexPath *indexPath = [theTable indexPathForCell:sender];
    Product *p = [[Catalog defaultCatalog] itemAtIndex:indexPath.row];
    [theCart addObject:p];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [theTable reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ( section == 0){
        return [[Catalog defaultCatalog] numberOfItems];
    }else{
        return [theCart count];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ( indexPath.section == 0){
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell"];
        Product *p = [[Catalog defaultCatalog] itemAtIndex:indexPath.row];
        [cell setProductInfo:p];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CartCell"];
        Product *p = [theCart objectAtIndex:indexPath.row];
        cell.textLabel.text = p.name;
        return cell;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return section==0? @"Catalog":@"Product";
}

@end
