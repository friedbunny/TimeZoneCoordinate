//
//  NSTimeZone+Coordinate.h
//
//  Created by Jason Wray on 2/14/17.
//  Copyright © 2017 Mapbox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface NSTimeZone (Coordinate)

@property (readonly) CLLocationCoordinate2D coordinate;

@end
