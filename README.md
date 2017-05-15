[![Platform](https://img.shields.io/cocoapods/p/TezGeocoder.svg?style=flat)](http://cocoapods.org/pods/TezGeocoder)
[![GitHub language](https://img.shields.io/badge/language-objective--c-6BAEE4.svg)]()
[![Version](https://img.shields.io/cocoapods/v/TezGeocoder.svg?style=flat)](http://cocoapods.org/pods/TezGeocoder)
[![License](https://img.shields.io/cocoapods/l/TezGeocoder.svg?style=flat)](http://cocoapods.org/pods/TezGeocoder)
[![Travis build](https://travis-ci.org/tezpark/TezGeocoder.svg?branch=master)](https://travis-ci.org/tezpark/TezGeocoder)

# TezGeocoder
Geocoding and reverse-geocoding

## Summary
* To support geocoding and reverse geocoding.
* This library only uses the iOS framework (CoreLocation, Contacts)
* Geocoding
  * Coordinate(latitude, longitude) -> Address information
* Reverse-geocoding
  * Address information -> Coordinate(latitude, longitude)

## Screenshots
![Sample1](./Sample/Sample1.gif)
![Sample2](./Sample/Sample2.gif)

## Requirements
* iOS SDK >= 8.0

## Installation
#### CocoaPods
TezGeocoder is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TezGeocoder"
```

## Usage
```objective-c
// Geocoding (Get coordinate with address info)
CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(37.499378, 127.043054);
TezGeocoder* reverseGeocoder = [[TezGeocoder alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
NSLog(@"(%@) %@ %@ %@ %@ %@ %@ %@",
      [reverseGeocoder postalCode],
      [reverseGeocoder country],
      [reverseGeocoder countryCode],
      [reverseGeocoder state],
      [reverseGeocoder city],
      [reverseGeocoder street],
      [reverseGeocoder subStreet],
      [reverseGeocoder name]);
      

// Geocoding (Get address info with coordinate)
NSString *addressStr = @"Yeoksam-dong ,Gangnam-gu, Seoul";
TezGeocoder *geocoder = [[TezGeocoder alloc] initWithAddressString:addressStr];
NSLog(@"lat:%f lon:%f", geocoder.location.coordinate.latitude, geocoder.location.coordinate.longitude);    
```


## Author

TezPark, ptswin@gmail.com

## License

TezGeocoder is available under the MIT license. See the LICENSE file for more info.
