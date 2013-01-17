//
// Created by sdt5 on 12. 10. 19..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "Product.h"

@protocol CatalogDelegate;

@interface CatalogCell : UITableViewCell
@property  (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@property  (weak, nonatomic) IBOutlet UILabel *name;
@property  (weak, nonatomic) IBOutlet UILabel *price;

@property (weak) id<CatalogDelegate> delegate;


-(IBAction)addToCart:(id)sender;

-(void) setProduct:(Product *)aProduct;

@end
