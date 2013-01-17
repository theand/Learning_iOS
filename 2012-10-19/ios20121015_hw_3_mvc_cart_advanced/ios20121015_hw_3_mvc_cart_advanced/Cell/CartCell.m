//
//  CartCell.m
//  ios20121015_hw_3_mvc_cart_advanced
//
//  Created by sdt5 on 10/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CartCell.h"
#import "Model.h"
#import "CartDelegate.h"

@implementation CartCell

@synthesize name;
@synthesize quantity;
@synthesize delegate;

- (void)setCartItem:(CartItem *)anItem {
    self.name.text = anItem.product.name;
    self.quantity.text = [NSString stringWithFormat:@"%d", anItem.quantity];
}

- (IBAction)increaseItem:(id)sender {
    NSLog(@"%s", sel_getName(_cmd));
    [delegate increaseItemByCode:self.name.text];

}

- (IBAction)decreaseItem:(id)sender {
    NSLog(@"%s", sel_getName(_cmd));
    [delegate decreaseItemByCode:self.name.text];
}


@end
