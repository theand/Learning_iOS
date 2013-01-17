//
// Created by sdt5 on 12. 10. 18..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class Product;


@interface CartItem : NSObject
@property(strong) Product *product;
@property int quantity;
@property int totalPrice;

+ (CartItem *)initWithProduct:(Product *)aProduct;

- (BOOL)isEqualToProductCode:(NSString *)aCode;

- (void)increaseQuantity;

- (void)decreaseQuantity;

- (BOOL)isEmpty;
@end
