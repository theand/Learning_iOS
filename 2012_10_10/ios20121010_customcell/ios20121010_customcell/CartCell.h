//
// Created by sdt5 on 12. 10. 10..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <UIKit/UIKit.h>

#import "CartItem.h"
#import "CartDelegate.h"

@interface CartCell  : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (weak, nonatomic) IBOutlet UILabel *itemPrice;
@property (weak, nonatomic) IBOutlet UILabel *itemQuantity;
@property (weak, nonatomic) CartItem *item;


@property (weak) IBOutlet id<CartDelegate> delegate;

- (void)setCartItemInfo:(CartItem *)i;

-(IBAction)plusItem:(id)sender;
-(IBAction)minusItem:(id)sender;


@end
