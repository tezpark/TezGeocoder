//
//  TezGeocoder.h
//  MyTripMap
//
//  Created by TezPark on 2017. 5. 15..
//  Copyright © 2017년 TezLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface TezGeocoder : NSObject

#pragma mark - Reverse-geocoding
/**
 *  Init & Generate geocoder with coordinate
 *
 *  @param lat latitude
 *  @param lon logitude
 *
 *  @return self
 */
- (id)initWithLatitude:(double)lat longitude:(double)lon;


#pragma mark - Geocoding
/**
 *  Init & Generate geocoder with string
 *
 *  @param addrStr address name string
 *
 *  @return self
 */
- (id)initWithAddressString:(NSString *)addrStr;


#pragma mark - Access address data
/**********************
 * Address dictionary *
 **********************/

/**
 *  address informations
 *
 *  @return address infos
 */
- (NSDictionary *)addressInfos;

/**
 *  Name (eg. Apple Inc.)
 *
 *  @return name string
 */
- (NSString *)name;

/**
 *  Sub street (eg. 1) / 번지
 *
 *  @return subStreet string
 */
- (NSString *)subStreet;

/**
 *  Street / Dong
 *
 *  @return street string
 */
- (NSString *)street;

// City / Gu,Gun
/**
 *  City / Gu,Gun
 *
 *  @return city string
 */
- (NSString *)city;

/**
 *  State (eg. Seoul) / Si, Do
 *
 *  @return state string
 */
- (NSString *)state;

/**
 *  Zip code (eg. 95014)
 *
 *  @return zip code string
 */
- (NSString *)postalCode;

/**
 *  ISO country code (eg. KR)
 *
 *  @return country code string
 */
- (NSString *)countryCode;

/**
 *  Country name (eg. South Korea)
 *
 *  @return country string
 */
- (NSString *)country;

/**
 *  Location
 *
 *  @return location
 */
- (CLLocation*)location;

@end
