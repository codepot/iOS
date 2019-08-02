//
//  ViewController.m
//  day9-core-location
//
//  Created by Dave Henson on 8/19/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupMyViews];
    
    [self setupCoreLocation];
}

-(void)setupMyViews
{
    self.labelLat = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 44)];
    [self.view addSubview:self.labelLat];
    
    self.labelLon = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 300, 44)];
    [self.view addSubview:self.labelLon];
    
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(10.0, 100.0, 300.0, 400.0)];
    [self.view addSubview:self.mapView];
}

-(void)zoom
{
    CLLocationCoordinate2D ucla;
    
    ucla.latitude = 34.8;
    ucla.longitude = -118.0;
    
    MKCoordinateRegion westwood = MKCoordinateRegionMakeWithDistance(ucla, 2000, 2000);
    [self.mapView setRegion:westwood animated:YES];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self zoom];
    
    CLLocation *ucla = [self.manager location];
    
    float uclaLatitude = ucla.coordinate.latitude;
    float uclaLongitude = ucla.coordinate.longitude;
    
    NSLog(@"ucla is at:%f %f", uclaLatitude, uclaLongitude);
    
    self.labelLat.text = [NSString stringWithFormat:@"Lat:%f", uclaLatitude];
    
    self.labelLon.text = [NSString stringWithFormat:@"Lon:%f", uclaLongitude];

    
}

-(void)setupCoreLocation
{
    self.manager = [[CLLocationManager alloc] init];
    self.manager.delegate = self;
    
    if([self.manager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
       [self.manager requestWhenInUseAuthorization];
    }
    
    [self.manager requestAlwaysAuthorization];
    
    [self.manager startUpdatingLocation];
    [self.manager startUpdatingHeading];
    
 
}
@end
