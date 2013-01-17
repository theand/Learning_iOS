//
//  ViewController.h
//  ios20121018_mapkit
//
//  Created by sdt5 on 10/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController
- (IBAction)moveToSeoul:(id)sender;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)addAnnotation:(id)sender;
- (IBAction)showShopping:(id)sender;
- (IBAction)showTheatre:(id)sender;
- (IBAction)showRestaurant:(id)sender;
- (IBAction)updateLocation:(id)sender;

@end