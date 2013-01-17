//
//  CartCell.h
//  ios20121015_hw_3_mvc_cart_advanced
//
//  Created by sdt5 on 10/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CartItem.h"

@protocol CartDelegate;


@interface CartCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *quantity;

@property (weak) id<CartDelegate> delegate;

-(void) setCartItem:(CartItem *)anItem;

-(IBAction)increaseItem:(id)sender;
-(IBAction)decreaseItem:(id)sender;


@end
