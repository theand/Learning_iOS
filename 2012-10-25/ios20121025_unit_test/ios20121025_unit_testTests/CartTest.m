//
// Created by sdt5 on 12. 10. 25..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CartTest.h"
#import "Cart.h"

@implementation CartTest {

}

-(void) testCart{
    Cart *cart = [[Cart alloc] init];
    [cart addProduct:@"iPhone"];

    STAssertEquals([cart numberOfProducts], 1, @"ERROR", nil);
}
@end
