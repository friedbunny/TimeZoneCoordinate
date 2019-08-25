//
//  NSTimeZone+Coordinate.h
//
//  Created by Jason Wray on 2/14/17.
//  Copyright © 2019 Jason Wray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface NSTimeZone (Coordinate)

/** Coordinate for the largest populated place within the given time zone. */
@property (readonly) CLLocationCoordinate2D coordinate;

@end
