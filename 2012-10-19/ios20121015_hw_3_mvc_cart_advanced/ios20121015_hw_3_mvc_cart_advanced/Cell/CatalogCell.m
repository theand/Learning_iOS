//
// Created by sdt5 on 12. 10. 19..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "CatalogCell.h"
#import "CatalogDelegate.h"
#import "Model.h"


@implementation CatalogCell {

}
@synthesize thumbnail ;
@synthesize name;
@synthesize price;
@synthesize delegate;

- (IBAction)addToCart:(id)sender {
    NSLog(@"%s", sel_getName(_cmd));
    [delegate addProductToCart: [[Catalog defaultCatalog] productByCode:self.name.text]];
}

- (void)setProduct:(Product *)aProduct {
    self.thumbnail.image = [UIImage imageNamed:aProduct.imagePath];
    self.name.text = aProduct.name;
    self.price.text = [NSString stringWithFormat:@"%d$", aProduct.price];
}



@end
