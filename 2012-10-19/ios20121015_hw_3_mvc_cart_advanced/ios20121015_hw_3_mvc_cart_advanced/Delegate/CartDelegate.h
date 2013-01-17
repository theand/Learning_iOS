//
//  CartDelegate.h
//  ios20121015_hw_3_mvc_cart_advanced
//
//  Created by sdt5 on 10/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol CartDelegate <NSObject>

- (void)increaseItemByCode:(NSString *)code;

- (void)decreaseItemByCode:(NSString *)code;

@end
