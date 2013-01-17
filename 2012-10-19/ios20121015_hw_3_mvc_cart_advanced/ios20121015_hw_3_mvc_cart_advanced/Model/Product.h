//
// Created by sdt5 on 12. 10. 18..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Product : NSObject

@property(strong) NSString *name;
@property int price;
@property(strong) NSString *imagePath;
@property(strong) NSString *code;

- (BOOL)isEqualToProductCode:(NSString *)aCode;

+ (Product *)initWithName:(NSString *)aName price:(int)aPrice;


@end
