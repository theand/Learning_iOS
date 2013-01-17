//
//  CatalogVC.m
//  ios20121015_hw_3_mvc_cart_advanced
//
//  Created by sdt5 on 10/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CatalogVC.h"
#import "Model.h"
#import "CatalogCell.h"
#import "ProductDetailVC.h"
#import "AppDelegate.h"

@interface CatalogVC ()
@property (weak, nonatomic) IBOutlet UITableView *catalogTableView;

@end

@implementation CatalogVC{
    Catalog *catalog;
    Cart *cart;
}
@synthesize catalogTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    catalog = [Catalog defaultCatalog];
    cart = [Cart defaultCart];
}

- (void)viewDidUnload
{
    [self setCatalogTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[Catalog defaultCatalog] numberOfProducts];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CatalogCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CATALOG_CELL"];
    Product *p = [[Catalog defaultCatalog] findByIndexAt:indexPath.row];
    [cell setProduct:p];
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 62;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s - row : %d", sel_getName(_cmd), indexPath.row);

}


- (void)addProductToCart:(Product *)product {
    [cart addItem:[catalog productByCode:product.name]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    ProductDetailVC *detailVC = segue.destinationViewController;

    NSIndexPath *path = [catalogTableView indexPathForCell:sender];
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    app.selectedProductCode = [catalog findByIndexAt:path.row].name;
}


@end
