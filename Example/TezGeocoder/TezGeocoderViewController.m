//
//  TezGeocoderViewController.m
//  TezGeocoder
//
//  Created by ptswin@gmail.com on 05/15/2017.
//  Copyright (c) 2017 ptswin@gmail.com. All rights reserved.
//

#import "TezGeocoderViewController.h"
#import <TezGeocoder/TezGeocoder.h>
#import <MapKit/MapKit.h>

@interface TezGeocoderViewController () <MKMapViewDelegate, UITextViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *searchField;

@end

@implementation TezGeocoderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.mapView setDelegate:self];
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    // Reverse-Geocoding (Get coordinate with address info)
    TezGeocoder* reverseGeocoder = [[TezGeocoder alloc] initWithLatitude:mapView.centerCoordinate.latitude longitude:mapView.centerCoordinate.longitude];
    [self.textView setText:[[reverseGeocoder addressInfos] description]];
    
    NSLog(@"(%@) %@ %@ %@ %@ %@ %@ %@",
          [reverseGeocoder postalCode],
          [reverseGeocoder country],
          [reverseGeocoder countryCode],
          [reverseGeocoder state],
          [reverseGeocoder city],
          [reverseGeocoder street],
          [reverseGeocoder subStreet],
          [reverseGeocoder name]);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.searchField resignFirstResponder];
    
    // Geocoding (Get address info with coordinate)
    TezGeocoder* geocoder = [[TezGeocoder alloc] initWithAddressString:textField.text];
    NSLog(@"lat:%f lon:%f", geocoder.location.coordinate.latitude, geocoder.location.coordinate.longitude);
    
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(geocoder.location.coordinate.latitude, geocoder.location.coordinate.longitude) animated:YES];
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
