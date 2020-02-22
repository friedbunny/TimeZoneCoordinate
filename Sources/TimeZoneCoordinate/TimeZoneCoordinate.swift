//
//  TimeZoneCoordinate.swift
//
//
//  Created by Jason Wray on 8/25/19.
//  Copyright © 2019 Jason Wray. All rights reserved.
//

import CoreLocation

@objc protocol Coordinates {
    var coordinate: CLLocationCoordinate2D { get }
}

extension TimeZone {
    public var coordinate: CLLocationCoordinate2D? {
        let tz = self as NSTimeZone
        let coord = tz.coordinate
        return CLLocationCoordinate2DIsValid(coord) ? coord : nil
    }
}

@objc
extension NSTimeZone: Coordinates {
    public var coordinate: CLLocationCoordinate2D {
        return TimeZoneCoordinates[self.name].map { CLLocationCoordinate2D(latitude: $0, longitude: $1) } ?? kCLLocationCoordinate2DInvalid
    }
}
