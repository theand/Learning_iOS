//
// Created by sdt5 on 12. 10. 18..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Catalog.h"


@implementation Catalog {
@private
    NSArray *list;
}
static Catalog *_instance = nil;

+ (Catalog *)defaultCatalog {
    if (_instance == nil) {
        _instance = [[Catalog alloc] init];
    }
    return _instance;
}

- (id)init {
    self = [super init];
    list = [[NSArray alloc] initWithObjects:
            [Product initWithName:@"Apple" price:10],
            [Product initWithName:@"Apricot" price:20],
            [Product initWithName:@"Banana" price:30],
            [Product initWithName:@"Cherry" price:40],
            [Product initWithName:@"Kiwi" price:50],
            [Product initWithName:@"Lemon" price:60],
            [Product initWithName:@"Mango" price:33],
            [Product initWithName:@"Orange" price:30],
            [Product initWithName:@"Peach" price:20],
            [Product initWithName:@"Pear" price:30],
            [Product initWithName:@"Strawberry" price:50],
            [Product initWithName:@"Tomato" price:10],
            nil];
    return self;
}

- (int)numberOfProducts {
    return [list count];
}

- (Product *)productByCode:(NSString *)aCode {
    for (Product *p in list) {
        if ([p isEqualToProductCode:aCode]) {
            return p;
        }
    }
    return nil;
}


- (Product *)findByIndexAt:(int)i {
    return [list objectAtIndex:i];
}
@end
