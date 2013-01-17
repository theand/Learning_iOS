//
// Created by sdt5 on 12. 10. 12..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ProductCell.h"


@implementation ProductCell {

}
@synthesize delegate;
@synthesize nameLabel;
@synthesize priceLabel;
@synthesize imageView;

- (void)setProductInfo:(Product *)p {
    nameLabel.text = p.name;
    priceLabel.text = [[NSString alloc] initWithFormat:@"%$d", p.price];
    imageView.image = [UIImage imageNamed:p.imageName];
}

- (IBAction)addToCart:(id)sender {
    [delegate addItemToCart:self];
}

@end
