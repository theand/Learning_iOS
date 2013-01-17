//
// Created by sdt5 on 12. 10. 10..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CartCell.h"


@implementation CartCell {
}
@synthesize item, itemName, itemPrice, itemQuantity;
@synthesize delegate;

- (void)setCartItemInfo:(CartItem *)i {
    self.item = i;
    self.itemName.text = i.name;
    self.itemPrice.text = [[NSString alloc] initWithFormat:@"%d%", i.totalprice];
    self.itemQuantity.text = [[NSString alloc] initWithFormat:@"%d", i.quantity];
}

- (IBAction)plusItem:(id)sender {
    [delegate increaseItem:self.item];
}

- (IBAction)minusItem:(id)sender {
    [delegate decreaseItem:self.item];

}

@end
