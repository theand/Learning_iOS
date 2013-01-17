//
// Created by sdt5 on 12. 10. 10..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ProductCell.h"


@implementation ProductCell {

}

@synthesize productName;
@synthesize productPrice;
@synthesize productImage;
@synthesize product;
@synthesize delegate;

- (void)setProductInfo:(Product *)p {
    self.product = p;
    self.productName.text = p.name;
    self.productPrice.text = [[NSString alloc] initWithFormat:@"%d$", p.price];
    self.productImage.image = [UIImage imageNamed:p.imageName];
}

-(IBAction)addCart:(id)sender{
    [delegate addToCart:self.product];
}

@end
