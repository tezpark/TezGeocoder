//
//  TezGeocoder.m
//  MyTripMap
//
//  Created by TezPark on 2017. 5. 15..
//  Copyright © 2017년 TezLab. All rights reserved.
//

#import "TezGeocoder.h"
#import <CoreLocation/CoreLocation.h>
#import <Contacts/CNPostalAddress.h>

@interface TezGeocoder ()
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

@property (nonatomic, strong) CLPlacemark *placemark;
@end



@implementation TezGeocoder

#pragma mark - Reverse-geocoding

- (id)initWithLatitude:(double)latitude longitude:(double)longitude {
    if (self == [super init]) {
        _latitude = latitude;
        _longitude = longitude;
        
        [self generatePlacemakr:_latitude longitude:_longitude];
    }
    return self;
}

/**
 *  [Private] Generate geocoder with coordinate
 *
 *  @param lat latitude
 *  @param lon longitude
 */
- (void)generatePlacemakr:(double)lat longitude:(double)lon {
    __block CLPlacemark *placemark = [CLPlacemark new];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(lat, lon);
    CLLocation* location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"Failed to reverse-geocode: %@", [error localizedDescription]);
            return;
        }
        
        placemark = [placemarks firstObject];
    }];
    
    _placemark = placemark;
}


- (NSDictionary *)addressInfos {
    return [self.placemark addressDictionary];
}

- (NSString *)name {
    return [self.placemark name];
}
- (NSString *)subStreet {
    return [self.placemark thoroughfare];
}
- (NSString *)street {
    return [self.placemark subThoroughfare];
}
- (NSString *)city {
    return [self.placemark locality];
}
- (NSString *)state {
    return [self.placemark administrativeArea];
}
- (NSString *)postalCode {
    return [self.placemark postalCode];
}
- (NSString *)countryCode {
    return [self.placemark ISOcountryCode];
}
- (NSString *)country {
    return [self.placemark country];
}

@end
