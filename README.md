# NSTimeZone+Coordinate

## Usage

```objc
NSTimeZone *timeZone = NSTimeZone.localTimeZone;
CLLocationCoordinate2D coordinate = timeZone.coordinate;

NSLog(@"%@: %f, %f", timeZone.description, coordinate.latitude, coordinate.longitude);
```

To set the center coordinate of a map view (e.g., using the [Mapbox iOS SDK](https://www.mapbox.com/ios-sdk/)):
```
[self.mapView setCenterCoordinate:NSTimeZone.localTimeZone.coordinate];
```
