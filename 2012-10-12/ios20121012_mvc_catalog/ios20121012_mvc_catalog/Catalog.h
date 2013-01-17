//
// Created by sdt5 on 12. 10. 12..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Catalog : NSObject
+(id) defaultCatalog;

-(id) itemAtIndex:(int)i;
-(int) numberOfItems;

@end
