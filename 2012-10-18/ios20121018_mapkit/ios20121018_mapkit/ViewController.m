//
//  ViewController.m
//  ios20121018_mapkit
//
//  Created by sdt5 on 10/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<MKMapViewDelegate, CLLocationManagerDelegate>

@end

@implementation ViewController {
    MKPointAnnotation *annotateTacademy;
    CLLocationManager *manager;
}
@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)moveToSeoul:(id)sender {
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(37.458, 126.925);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.3, 0.3);
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    [mapView setRegion:region animated:YES];

}
- (IBAction)addAnnotation:(id)sender {
    NSLog(@"%s", sel_getName(_cmd));
    if ( annotateTacademy == nil ){
        annotateTacademy = [[MKPointAnnotation alloc] init];
        CLLocationCoordinate2D loc ;//= CLLocationCoordinate2DMake(37.466, 126.96);
        loc.latitude = 37.466;
        loc.longitude = 126.96;
        annotateTacademy.coordinate = loc;
        annotateTacademy.title = @"T-Academy";
        [mapView addAnnotation:annotateTacademy];
    }else{
        [mapView removeAnnotation:annotateTacademy];
        annotateTacademy = nil;
    }
}

- (IBAction)showShopping:(id)sender {
    NSLog(@"%s", sel_getName(_cmd));
}

- (IBAction)showTheatre:(id)sender {
    NSLog(@"%s", sel_getName(_cmd));
}

- (IBAction)showRestaurant:(id)sender {
    NSLog(@"%s", sel_getName(_cmd));
}

- (IBAction)updateLocation:(id)sender {
    if( manager == nil){
        manager = [[CLLocationManager alloc] init];
        manager.delegate = self;
        manager.purpose = @" 테스트 ";
        [manager startUpdatingLocation];
    }else{
        [manager stopUpdatingLocation];
        manager = nil;
    }
}

- (void)locationManager:(CLLocationManager *)manager1 didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    CLLocationCoordinate2D coord = [newLocation coordinate];
    NSLog(@"%f, %f", coord.latitude, coord.longitude);

}

- (void)mapView:(MKMapView *)mapView1 didSelectAnnotationView:(MKAnnotationView *)view {
    NSLog(@"%s", sel_getName(_cmd));
}

- (void)mapView:(MKMapView *)mapView1 annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    NSLog(@"%s", sel_getName(_cmd));

}

- (void)mapView:(MKMapView *)mapView1 didDeselectAnnotationView:(MKAnnotationView *)view {
    NSLog(@"%s", sel_getName(_cmd));

}


#define ANNOTATION_ID @"ANNODATION_ID"

- (MKAnnotationView *)mapView:(MKMapView *)mapView1 viewForAnnotation:(id <MKAnnotation>)annotation {
    NSLog(@"%s", sel_getName(_cmd));
    MKAnnotationView *view = [mapView1 dequeueReusableAnnotationViewWithIdentifier:ANNOTATION_ID];
    if (  view == nil){
        view = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:ANNOTATION_ID];
        view.canShowCallout = YES;
        view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        view.image = [UIImage imageNamed:@"arrow.png"];
    }

    return view;
}


@end
