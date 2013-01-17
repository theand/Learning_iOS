//
// Created by sdt5 on 12. 10. 10..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Product.h"

@interface CartItem : NSObject
@property (weak, nonatomic) NSString *name;
@property int unitprice;
@property int totalprice;
@property int quantity;

- (id)initWithProduct:(Product *)p;

- (void)increase;

- (void)decrease;
@end
