//
//  NSTimeZone+Coordinate.m
//
//  Created by Jason Wray on 2/14/17.
//  Copyright © 2017 Mapbox. All rights reserved.
//

#import "NSTimeZone+Coordinate.h"

@implementation NSTimeZone (Coordinate)

- (CLLocationCoordinate2D)coordinate {
    CLLocationCoordinate2D coord = kCLLocationCoordinate2DInvalid;

    // Look-up timezone in plist by name.
    NSArray *coordinates = [[self timeZonesDictionary] objectForKey:self.name];
    if (coordinates) {
        coord = CLLocationCoordinate2DMake([coordinates[0] doubleValue],
                                           [coordinates[1] doubleValue]);
    }

    return coord;
}

- (NSDictionary *)timeZonesDictionary {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"timezones" ofType:@"plist"];
    return [NSDictionary dictionaryWithContentsOfFile:path];
}

@end
