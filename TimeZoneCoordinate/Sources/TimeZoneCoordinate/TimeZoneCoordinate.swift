//
//  TimeZoneCoordinate.swift
//
//
//  Created by Jason Wray on 8/25/19.
//  Copyright © 2019 Jason Wray. All rights reserved.
//

import CoreLocation

extension TimeZone {
    public var coordinate: CLLocationCoordinate2D? {
        return TimeZoneCoordinates[self.identifier].map { CLLocationCoordinate2D(latitude: $0, longitude: $1) }
    }
}
