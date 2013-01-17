//
// Created by sdt5 on 12. 10. 10..
//
// To change the template use AppCode | Preferences | File Templates.
//



#import <UIKit/UIKit.h>
#import "Product.h"
#import "CartDelegate.h"

@interface ProductCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) Product *product;

@property (weak) IBOutlet id<CartDelegate> delegate;

- (void)setProductInfo:(Product *)p;
-(IBAction)addCart:(id)sender;
@end
