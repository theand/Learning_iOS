//
//  ViewController.m
//  ios20121010_customcell
//
//  Created by sdt5 on 10/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "ProductCell.h"
#import "CartCell.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray *products;
    NSMutableDictionary *cartitems;
    NSArray *cartKeyArray;
}
@synthesize theTable;

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableArray *p = [[NSMutableArray alloc] init];
    [p addObject:[Product initWithName:@"Apple" price:2 imageName:@"Apple.png"]];
    [p addObject:[Product initWithName:@"Apricot" price:3 imageName:@"Apricot.png"]];
    [p addObject:[Product initWithName:@"Banana" price:4 imageName:@"Banana.png"]];
    [p addObject:[Product initWithName:@"Cherry" price:2 imageName:@"Cherry.png"]];
    [p addObject:[Product initWithName:@"Kiwi" price:1 imageName:@"Kiwi.png"]];
    [p addObject:[Product initWithName:@"Lemon" price:1 imageName:@"Lemon.png"]];


    products = [[NSMutableArray alloc] initWithArray:p];
    cartitems = [[NSMutableDictionary alloc] init];

    //TODO comparator  문제.
    cartKeyArray = [cartitems keysSortedByValueUsingSelector:@selector(compare:)];

//    [data[1] addObject:@"TEST"];
//    p = nil;
//    NSLog(@"data :%@", data[1]);
}


- (void)viewDidUnload {
    [self setTheTable:nil];
    [super viewDidUnload];

    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell"];
        Product *p = [products objectAtIndex:indexPath.row];
        [cell setProductInfo:p];
        NSLog(@"ProductCell - %@", p.name);
        return cell;
    } else {
        CartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CartCell"];
        CartItem *i = [cartitems objectForKey: [cartKeyArray objectAtIndex:indexPath.row]];
        [cell setCartItemInfo:i];
        NSLog(@"CartCell - %@", i.name);
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return [products count];
    } else {
        return [cartitems count];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return section == 0 ? @"Product" : @"Cart";
}

- (void)addToCart:(id)item {
    Product *p = (Product *) item;
    CartItem *c = [[CartItem alloc] initWithProduct:p];
    if ([cartitems objectForKey:c.name]) {
        [self increaseItem:c];
    } else {
        [cartitems setObject:c forKey:c.name];
        cartKeyArray = [cartitems keysSortedByValueUsingSelector:@selector(compare:)];
    }
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [theTable reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    NSLog(@"addToCart: %@", cartitems);
}

- (void)increaseItem:(id)item {

    CartItem *c = (CartItem *) item;
    CartItem *i = [cartitems objectForKey:c.name];
    [i increase];

    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [theTable reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];

    NSLog(@"increase : %@", i);

}

- (void)decreaseItem:(id)item {
    CartItem *c = (CartItem *) item;
    CartItem *i = [cartitems objectForKey:c.name];
    [i decrease];
    if (i.quantity == 0) {
        [cartitems removeObjectForKey:i.name];
        cartKeyArray = [cartitems keysSortedByValueUsingSelector:@selector(compare:)];
    }

    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [theTable reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];

    NSLog(@"decrease : %@", i);
}

@end
