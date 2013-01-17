//
// Created by sdt5 on 12. 10. 25..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Cart.h"


@implementation Cart {
    NSMutableArray *data;
}

-(id) init{
    self = [super init];
    data = [[NSMutableArray alloc] init];
    return self;
}
- (void)addProduct:(NSString *)string {
    [data addObject:string];

}

- (int) numberOfProducts{
    return [data count];
}
@end
