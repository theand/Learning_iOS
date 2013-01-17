//
// Created by sdt5 on 12. 10. 10..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CartItem.h"


@implementation CartItem {

}
@synthesize quantity;
@synthesize name;
@synthesize totalprice;
@synthesize unitprice;

- (id)initWithProduct:(Product *)p {
    self = [super init];
    if (self) {
        name = p.name;
        unitprice = p.price;
        totalprice = p.price;
        quantity = 1;
    }

    return self;
}

- (void)increase {
    self.totalprice += self.unitprice;
    self.quantity += 1;
}

- (void)decrease {
    self.totalprice -= self.unitprice;
    self.quantity -= 1;
    if ( self.quantity == 0){
        NSLog(@"TODO: reached at zero");
    }
}

- (NSString *)description {
    return [[NSString alloc] initWithFormat:@"CartItem : name - %@ / totalprice - %d / quantity - %d", name, totalprice, quantity];
}

@end
