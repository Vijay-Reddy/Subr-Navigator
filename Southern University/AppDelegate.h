//
//  AppDelegate.h
//  Southern University
//
//  Created by admin on 02/05/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic,strong)CLLocationManager *locationManager;

@end

