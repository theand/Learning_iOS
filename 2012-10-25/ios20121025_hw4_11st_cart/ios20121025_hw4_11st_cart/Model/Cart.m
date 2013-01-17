//
// Created by sdt5 on 12. 10. 18..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Cart.h"
#import "Product.h"


@implementation Cart {

@private
    NSMutableArray *list;
}

static Cart *_instance = nil;

+ (Cart *)defaultCart {
    if (_instance == nil) {
        _instance = [[Cart alloc] init];
    }
    return _instance;
}


- (id)init {
    self = [super init];
    list = [[NSMutableArray alloc] init];
    return self;
}


- (int)numberOfItems {
    return [list count];
}

- (id)findByProductCode:(NSString *)aCode {
    for (CartItem *item in list) {
        if ([item isEqualToProductCode:aCode]) {
            return item;
        }
    }
    return nil;
}

- (void)addItem:(Product *)product {
    NSLog(@"%@ %s - %@", NSStringFromClass([self class]), sel_getName(_cmd), product);
    if( [self findByProductCode:product.name] == nil){
        CartItem *item = [CartItem initWithProduct:product];
        [list addObject:item];
    }else{
        NSLog(@"%@ has already exist, so increase quantity", product );
        [self increaseItemForProductCode:product.code];
    }
}

- (void)increaseItemForProductCode:(NSString *)aCode {
    CartItem *item = [self findByProductCode:aCode];
    [item increaseQuantity];
}

- (void)decreaseItemForProductCode:(NSString *)aCode {
    CartItem *item = [self findByProductCode:aCode];
    [item decreaseQuantity];
    if ([item isEmpty]) {
        [list removeObject:item];
        NSLog(@"%@ %s - item is empty, so remove item", NSStringFromClass([self class]), sel_getName(_cmd));
    }
}


- (CartItem *)findByIndexAt:(int)i {
    return [list objectAtIndex:i];
}
@end
