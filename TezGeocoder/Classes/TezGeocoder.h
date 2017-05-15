//
//  TezGeocoder.h
//  MyTripMap
//
//  Created by TezPark on 2017. 5. 15..
//  Copyright © 2017년 TezLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TezGeocoder : NSObject

#pragma mark - Reverse-geocoding

/**************
 * Initialize *
 **************/

- (id)initWithLatitude:(double)lat longitude:(double)lon;


/**********************
 * Address dictionary *
 **********************/

/**
 *  Reverse-geocoding : address informations
 *
 *  @return address infos
 */
- (NSDictionary *)addressInfos;

/**
 *  Reverse-geocoding : Name (eg. Apple Inc.)
 *
 *  @return name string
 */
- (NSString *)name;

/**
 *  Reverse-geocoding : Sub street (eg. 1) / 번지
 *
 *  @return subStreet string
 */
- (NSString *)subStreet;

/**
 *  Reverse-geocoding : Street / Dong
 *
 *  @return street string
 */
- (NSString *)street;

// City / Gu,Gun
/**
 *  Reverse-geocoding : City / Gu,Gun
 *
 *  @return city string
 */
- (NSString *)city;

/**
 *  Reverse-geocoding : State (eg. Seoul) / Si, Do
 *
 *  @return state string
 */
- (NSString *)state;

/**
 *  Reverse-geocoding : Zip code (eg. 95014)
 *
 *  @return zip code string
 */
- (NSString *)postalCode;

/**
 *  Reverse-geocoding : ISO country code (eg. KR)
 *
 *  @return country code string
 */
- (NSString *)countryCode;

/**
 *  Reverse-geocoding : Country name (eg. South Korea)
 *
 *  @return country string
 */
- (NSString *)country;


#pragma mark - Geocoding
- (id)initWithAddressString:(NSString *)addrStr;

@end
