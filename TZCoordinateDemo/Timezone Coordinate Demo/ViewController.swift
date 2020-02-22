//
//  ViewController.swift
//  Timezone Coordinate Demo
//
//  Created by Jason Wray on 8/25/19.
//  Copyright © 2019 Jason Wray. All rights reserved.
//

import TimeZoneCoordinate
import MapKit

class ViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let coordinate = TimeZone.current.coordinate {
            mapView.centerCoordinate = coordinate
            print("\(TimeZone.current): \(NSString(format: "%.3f, %.3f", coordinate.latitude, coordinate.longitude))")
        }

        addPinsForAvailableTimeZones()

        if #available(iOS 11.0, *) {
            mapView.mapType = .mutedStandard
        }
    }

    func addPinsForAvailableTimeZones() {
        var annotations: [MKPointAnnotation] = []
        for timeZoneIdentifier in TimeZone.knownTimeZoneIdentifiers {
            guard let timezone = TimeZone(identifier: timeZoneIdentifier) else { return }

            if let coordinate = timezone.coordinate {
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = timezone.identifier
                annotation.subtitle = NSString(format: "%.3f, %.3f", coordinate.latitude, coordinate.longitude) as String

                annotations.append(annotation)
            }
        }

        mapView.addAnnotations(annotations)
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var pin: MKPinAnnotationView

        if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin") as? MKPinAnnotationView {
            pin = annotationView
        } else {
            pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        }

        pin.canShowCallout = true

        if annotation.title == TimeZone.current.identifier {
            pin.pinTintColor = .systemGreen
        }

        return pin;
    }
}
