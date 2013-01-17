//
// Created by sdt5 on 12. 10. 12..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Model : NSObject

@property NSMutableArray *_data;

-(int) numberOfProducts;
-(id) productAtIndex:(int) i;
-(void) addProduct:(id)p;
-(void) removeProductAtIndex:(int)i;

+ (Model *) getSharedModel;


@end
