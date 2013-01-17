//
// Created by sdt5 on 12. 10. 18..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CartItem.h"
#import "Product.h"


@implementation CartItem {

@private
    Product *_product;
    int _quantity;
    int _totalPrice;
}
@synthesize product = _product;
@synthesize quantity = _quantity;
@synthesize totalPrice = _totalPrice;


- (BOOL)isEqualToProductCode:(NSString *)aCode {
    return [_product isEqualToProductCode:aCode];
}

- (void)increaseQuantity {
    NSLog(@"%@ %s : %@", NSStringFromClass([self class]), sel_getName(_cmd), self.product);
    _quantity += 1;
    _totalPrice = _quantity * _product.price;
}

- (void)decreaseQuantity {
    NSLog(@"%@ %s : %@", NSStringFromClass([self class]), sel_getName(_cmd), self.product);
    _quantity -= 1;
    _totalPrice = _quantity * _product.price;
}

- (BOOL)isEmpty {
    return _quantity == 0 ? YES : NO;
}


+ (CartItem *)initWithProduct:(Product *)aProduct {
    NSLog(@"%@ %s : %@", NSStringFromClass([self class]), sel_getName(_cmd), aProduct);
    CartItem *item = [[CartItem alloc] init];
    item.product = aProduct;
    item.quantity = 1;
    item.totalPrice = aProduct.price;
    return item;
}

- (BOOL)isEqual:(id)object {
    return [object isEqualToProductCode:_product.code];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"[%@ : quantity %d, total price %d]", self.product, self.quantity, self.totalPrice];
}


@end
