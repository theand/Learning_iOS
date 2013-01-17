//
// Created by sdt5 on 12. 10. 10..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Product.h"


@implementation Product {

}
@synthesize name;
@synthesize price;
@synthesize imageName;

+ (id)initWithName:(NSString *)name price:(int)price imageName:(NSString *)imageName {
    Product *p = [[Product alloc] init];
    p.name = name;
    p.price = price;
    p.imageName = imageName;

    return p;
}


@end
