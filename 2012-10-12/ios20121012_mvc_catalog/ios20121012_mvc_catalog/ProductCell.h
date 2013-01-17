//
// Created by sdt5 on 12. 10. 12..
//
// To change the template use AppCode | Preferences | File Templates.
//

#import <UIKit/UIKit.h>
#import "CartDelegate.h"
#import "Product.h"

@interface ProductCell : UITableViewCell
-(IBAction)addToCart:(id)sender;
@property (weak) IBOutlet id<CartDelegate> delegate;

-(void) setProductInfo:(Product *)p;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
