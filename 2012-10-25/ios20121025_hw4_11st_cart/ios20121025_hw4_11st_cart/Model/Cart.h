//
// Created by sdt5 on 12. 10. 18..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "CartItem.h"

@interface Cart : NSObject


+ (Cart *)defaultCart;

- (int)numberOfItems;

- (id)findByProductCode:(NSString *)aCode;

- (void)addItem:(Product *)product;

- (void)increaseItemForProductCode:(NSString *)aCode;

- (void)decreaseItemForProductCode:(NSString *)aCode;

- (CartItem *)findByIndexAt:(int)i;
@end
