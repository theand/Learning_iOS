//
// Created by sdt5 on 12. 10. 18..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Product.h"

@interface Catalog : NSObject

+ (Catalog *)defaultCatalog;

- (int)numberOfProducts;

- (Product *)productByCode:(NSString *)aCode;

- (Product *)findByIndexAt:(int)i;
@end
