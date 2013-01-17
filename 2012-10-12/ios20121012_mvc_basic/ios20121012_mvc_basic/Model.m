//
// Created by sdt5 on 12. 10. 12..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Model.h"


@implementation Model {

}
@synthesize _data;

+ (Model *)getSharedModel {
    static Model *i;
    if( i == nil){
        i = [[Model alloc] init];
    }
    return i;
}

- (int)numberOfProducts {
    return [_data count ];
}

- (id)productAtIndex:(int)i {
    return [_data objectAtIndex:i];
}

- (void)addProduct:(id)p {
    [_data addObject:p];
}

- (void)removeProductAtIndex:(int)i {
    [_data removeObjectAtIndex:i];
}

-(id)init {
    self = [super init];
    if ( self){
        _data = [[NSMutableArray alloc] initWithObjects:@"iPhone", @"iPod", @"MacBook Air", @"MacBook Pro", @"iMac", @"MacPro", nil];
    }
    return self;
}

@end
