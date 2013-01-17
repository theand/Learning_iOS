//
// Created by sdt5 on 12. 10. 12..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Catalog.h"
#import "Product.h"

@implementation Catalog {
    NSArray *data;
}
static Catalog *instance;

+ (id)defaultCatalog {
    if (instance == nil) {
        instance = [[Catalog alloc] init];
    }
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        data = [[NSArray alloc] initWithObjects:
                [Product initWithName:@"Apple" price:10 imageName:@"Apple.png"],
                [Product initWithName:@"Apricot" price:20 imageName:@"Apricot.png"],
                [Product initWithName:@"Banana" price:30 imageName:@"Banana.png"],
                [Product initWithName:@"Cherry" price:40 imageName:@"Cherry.png"],
                [Product initWithName:@"Kiwi" price:50 imageName:@"Kiwi.png"],
                [Product initWithName:@"Lemon" price:60 imageName:@"Lemon.png"],
                nil];
    }
    return self;
}

- (id)itemAtIndex:(int)i {
    return [data objectAtIndex:i];
}

- (int)numberOfItems {
    return [data count];
}

@end
