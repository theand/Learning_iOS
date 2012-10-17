//
//  ViewController.m
//  ios20121008_imageviewpicker
//
//  Created by sdt5 on 10/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSArray *data;
}
@synthesize picker;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    data = [[NSArray alloc] initWithObjects:@"Argentina.gif", @"Australia.gif", @"Austria.gif", @"Belgium.gif", @"Brazil.gif", @"Cameroon.gif", @"Canada.gif", @"Chile.gif", @"China.gif", nil];
}

- (void)viewDidUnload
{
    [self setPicker:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [data count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"selected :  %d", row);

}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 96;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UIImage *img = [UIImage imageNamed:[data objectAtIndex:row]];
    UIImageView *imgview;

    if ( view == nil){
        NSLog(@"non-resuing");
        imgview = [[UIImageView alloc] initWithImage:img];
        imgview.frame = CGRectMake(0, 0, 96, 96);
    }else{
        NSLog(@"reusing");
        imgview = (UIImageView *) view;
        imgview.image = img;
    }

    return imgview;
}

- (IBAction)randomTouched:(id)sender {
    int r = arc4random()%[data count];
    [picker selectRow:r inComponent:0 animated:YES];
}
@end
