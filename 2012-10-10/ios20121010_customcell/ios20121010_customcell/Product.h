//
// Created by sdt5 on 12. 10. 10..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Product : NSObject

@property (strong) NSString *name;
@property int price;
@property (strong) NSString *imageName;

+(id)initWithName:(NSString *)name price:(int)price imageName:(NSString *)imageName;

@end
