//
// Created by sdt5 on 12. 10. 26..
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ProductDetailVC.h"
#import "AppDelegate.h"
#import "Model.h"

@interface ProductDetailVC ()

@end

@implementation ProductDetailVC
@synthesize thumbnail;
@synthesize name;
@synthesize price;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setThumbnail:nil];
    [self setName:nil];
    [self setPrice:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated {
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    Product *p = [[Catalog defaultCatalog] productByCode:app.selectedProductCode];

    self.name.text = p.name;
    self.price.text = [NSString stringWithFormat:@"%d$", p.price];
    self.thumbnail.image = [UIImage imageNamed:p.imagePath];
    self.title = p.name;
}

@end
