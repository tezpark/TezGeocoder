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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
//    TezGeocoder* reverseGeocoder = [[TezGeocoder alloc] initWithLatitude:37.499411 longitude:127.043039];
    TezGeocoder* reverseGeocoder = [[TezGeocoder alloc] initWithLatitude:mapView.centerCoordinate.latitude longitude:mapView.centerCoordinate.longitude];
    NSLog(@"%@", [reverseGeocoder addressInfos]);
    NSLog(@"(%@) %@ %@ %@ %@ %@ %@ %@",
          [reverseGeocoder postalCode],
          [reverseGeocoder country],
          [reverseGeocoder countryCode],
          [reverseGeocoder state],
          [reverseGeocoder city],
          [reverseGeocoder street],
          [reverseGeocoder subStreet],
          [reverseGeocoder name]);

    
    [self.textView setText:[[reverseGeocoder addressInfos] description]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.searchField resignFirstResponder];
    
//    TezGeocoder* geocoder = [TezGeocoder alloc]
    
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
