//
// Created by sdt5 on 12. 10. 18..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Product.h"


@implementation Product {

@private
    NSString *_name;
    int _price;
    NSString *_imagePath;
    NSString *_code;
}
@synthesize name = _name;
@synthesize price = _price;
@synthesize imagePath = _imagePath;
@synthesize code = _code;

- (BOOL)isEqualToProductCode:(NSString *)aCode {
    if ([_code isEqualToString:aCode])
        return YES;
    else
        return NO;
}

+ (Product *)initWithName:(NSString *)aName price:(int)aPrice {
    Product *p = [[Product alloc] init];
    p.name = aName;
    p.price = aPrice;
    p.imagePath = [NSString stringWithFormat:@"%@.png", aName];
    p.code = [NSString stringWithFormat:@"%@", aName];
    return p;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"[%@ - %d]", self.name, self.price];
}


@end
