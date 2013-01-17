//
//  CatalogDelegate.h
//  ios20121015_hw_3_mvc_cart_advanced
//
//  Created by sdt5 on 10/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@protocol CatalogDelegate <NSObject>
- (void)addProductToCart:(Product *)product;

@end
