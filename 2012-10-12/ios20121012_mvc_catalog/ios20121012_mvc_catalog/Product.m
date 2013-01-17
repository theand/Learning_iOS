//
// Created by sdt5 on 12. 10. 12..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Product.h"


@implementation Product {

}
@synthesize name;
@synthesize price;
@synthesize imageName;

+ (id)initWithName:(NSString *)name1 price:(int)price1 imageName:(NSString *)imageName1 {
    Product *p = [[Product alloc] init];
    p.name = name1;
    p.price = price1;
    p.imageName = imageName1;
    return p;
}

@end
