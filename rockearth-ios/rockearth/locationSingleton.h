//
//  locationSingleton.h
//  rockearth
//
//  Created by Rafi Rizwan on 10/16/15.
//  Copyright © 2015 NYC2015. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol centralLocationDelegate <NSObject>

- (void)recievedLocation:(CLLocation*)location;

@end


@interface locationSingleton : NSObject <CLLocationManagerDelegate>


@property (weak, nonatomic) id<centralLocationDelegate>cDelegate;

@property (nonatomic, strong) CLLocation* location;

@property (nonatomic, strong) CLLocationManager* locationManager;

@end
