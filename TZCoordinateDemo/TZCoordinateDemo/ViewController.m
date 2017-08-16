//
//  ViewController.m
//  TZCoordinateDemo
//
//  Created by Jason Wray on 3/27/17.
//  Copyright © 2017 Mapbox. All rights reserved.
//

#import "ViewController.h"

#import "NSTimeZone+Coordinate.h"
#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];

    CLLocationCoordinate2D tzCoordinate = NSTimeZone.localTimeZone.coordinate;
    if (CLLocationCoordinate2DIsValid(tzCoordinate)) {
        [self.mapView setCenterCoordinate:tzCoordinate animated:YES];
    }

    NSLog(@"%@: %f, %f", NSTimeZone.localTimeZone, tzCoordinate.latitude, tzCoordinate.longitude);

    [self addPinsForAvailableTimeZones];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    MKPinAnnotationView *pin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pin"] ?: [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
    pin.canShowCallout = YES;

    if ([annotation.title isEqualToString:NSTimeZone.localTimeZone.name]) {
        pin.pinColor = MKPinAnnotationColorGreen;
    }

    return pin;
}

- (void)addPinsForAvailableTimeZones {
    NSMutableArray *annotations = [NSMutableArray array];
    for (NSString *tzString in NSTimeZone.knownTimeZoneNames) {
        NSTimeZone *tz = [NSTimeZone timeZoneWithName:tzString data:nil];

        MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
        pin.coordinate = tz.coordinate;
        pin.title = tz.name;
        pin.subtitle = [NSString stringWithFormat:@"%f, %f", tz.coordinate.latitude, tz.coordinate.longitude];

        [annotations addObject:pin];
    }

    [self.mapView addAnnotations:annotations];
}

@end
