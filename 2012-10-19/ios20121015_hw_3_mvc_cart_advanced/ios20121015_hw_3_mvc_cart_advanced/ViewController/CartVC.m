//
//  CartVC.m
//  ios20121015_hw_3_mvc_cart_advanced
//
//  Created by sdt5 on 10/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CartVC.h"
#import "Cart.h"
#import "CartCell.h"
#import "Model.h"

@interface CartVC ()
@property (weak, nonatomic) IBOutlet UITableView *cartTableView;

@end

@implementation CartVC{
    Catalog *catalog;
    Cart *cart;
}
@synthesize cartTableView;

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
    //TODO  싱글톤은  AppDelegate 를 이용한 데이터 공유할 필요가 없는건가?

    NSLog(@"%@ %s : numberOfItems in Cart: %d", NSStringFromClass([self class]), sel_getName(_cmd),  [cart numberOfItems]);
}


- (void)consoleModelTest {

    NSLog(@"%@ : numOfProducts in Catalog : %d", NSStringFromClass([self class]), [catalog numberOfProducts]);

    NSLog(@"%@ : Find Banana : %@",NSStringFromClass([self class]), [catalog productByCode:@"Banana"]);

    [cart addItem:[catalog productByCode:@"Banana"]];
    NSLog(@"%@ : numberOfItems in Cart: %d", NSStringFromClass([self class]), [cart numberOfItems]);

    [cart addItem:[catalog productByCode:@"Kiwi"]];
    NSLog(@"%@ : numberOfItems in Cart: %d", NSStringFromClass([self class]), [cart numberOfItems]);

    [cart increaseItemForProductCode:@"Banana"];
    NSLog(@"%@ : itemInfo Banana: %@", NSStringFromClass([self class]), [cart findByProductCode:@"Banana"]);

    [cart addItem:[catalog productByCode:@"Kiwi"]];
    NSLog(@"%@ : numberOfItems in Cart: %d", NSStringFromClass([self class]), [cart numberOfItems]);

//    [cart decreaseItemForProductCode:@"Banana"];
//    [cart decreaseItemForProductCode:@"Banana"];
    NSLog(@"%@ : numberOfItems in Cart: %d", NSStringFromClass([self class]), [cart numberOfItems]);
}


- (void)viewDidUnload
{
    [self setCartTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[Cart defaultCart] numberOfItems];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CartCell *cell = (CartCell *) [tableView dequeueReusableCellWithIdentifier:@"CART_CELL"];

    CartItem *item = [[Cart defaultCart] findByIndexAt:indexPath.row];

    [cell setCartItem:item];
    cell.delegate = self;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (void)increaseItemByCode:(NSString *)code {
    [cart increaseItemForProductCode:code];
    [cartTableView reloadData];
}

- (void)decreaseItemByCode:(NSString *)code {
    [cart decreaseItemForProductCode:code];
    [cartTableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%@ %s : numberOfItems in Cart: %d", NSStringFromClass([self class]), sel_getName(_cmd), [cart numberOfItems]);
    [cartTableView reloadData];
}

@end
