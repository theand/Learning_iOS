//
// Created by sdt5 on 12. 10. 10..
//
// To change the template use AppCode | Preferences | File Templates.
//


@protocol CartDelegate <NSObject>
-(void)addToCart:(id)product;
-(void)increaseItem: (id) item;
-(void)decreaseItem: (id) item;
@end
