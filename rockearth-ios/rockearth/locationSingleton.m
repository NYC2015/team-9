//
//  locationSingleton.m
//  rockearth
//
//  Created by Rafi Rizwan on 10/16/15.
//  Copyright © 2015 NYC2015. All rights reserved.
//

#import "locationSingleton.h"

@implementation locationSingleton{
    
}

+ (instancetype)sharedLocation{
    static locationSingleton* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)findLocaton{
    NSLog(@"initializing location");
    
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager setDelegate:self];
    [_locationManager requestWhenInUseAuthorization];
    [_locationManager startUpdatingLocation];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    [_locationManager stopUpdatingLocation];
    
    _location = [locations lastObject];
    [self.cDelegate recievedLocation:_location];
}

@end
