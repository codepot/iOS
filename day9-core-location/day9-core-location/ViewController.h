//
//  ViewController.h
//  day9-core-location
//
//  Created by Dave Henson on 8/19/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>

@property(nonatomic, strong) CLLocationManager *manager;

@property() UILabel *labelLat;
@property() UILabel *labelLon;
@property() MKMapView *mapView;

@end

