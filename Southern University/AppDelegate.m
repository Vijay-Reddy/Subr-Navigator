//
//  AppDelegate.m
//  Southern University
//
//  Created by admin on 02/05/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "AppDelegate.h"

//#import <GoogleMaps/GoogleMaps.h>
@import GoogleMaps;
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize locationManager;

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"%@", [url absoluteString]);
   // [receiveView setReceivedURL:url];
    return YES;
}

/* Deprecated forwarding method implemented for backward compatibility with iOS < 4.0
 */
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [self application:application openURL:url sourceApplication:@"Southern" annotation:nil];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [GMSServices provideAPIKey:@"AIzaSyC4ig0byPi2kdFRPRfKFVPBgYGTrw90W4o"];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
   
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if([[UIDevice currentDevice].systemVersion floatValue]>=8.0)
    {
        if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
        {
            [locationManager requestAlwaysAuthorization];
            [locationManager requestWhenInUseAuthorization];
        }
    }
    [locationManager startUpdatingLocation];

    
    // Override point for customization after application launch.
    return YES;
}
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSString * token = [[deviceToken description] stringByTrimmingCharactersInSet:      [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    [pref setObject:token forKey:@"DeviceToken"];
    [pref synchronize];
    // deviceid=%@&dtype=%@"token,[[UIDevice currentDevice] model]];
    
}
-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation *)newLocation
          fromLocation:(CLLocation *)oldLocation
{
    NSUserDefaults *prefs=[NSUserDefaults standardUserDefaults];
    int degrees = newLocation.coordinate.latitude;
    double decimal = fabs(newLocation.coordinate.latitude - degrees);
    int minutes = decimal * 60;
    double seconds = decimal * 3600 - minutes * 60;
    // NSString *lat = [NSString stringWithFormat:@"%d° %d' %1.4f\"",degrees, minutes, seconds];
    NSString *lat = [NSString stringWithFormat:@"%d° %d' %1.4f\"",degrees, minutes, seconds];
    degrees = newLocation.coordinate.longitude;
    decimal = fabs(newLocation.coordinate.longitude - degrees);
    minutes = decimal * 60;
    seconds = decimal * 3600 - minutes * 60;
    NSString *longt = [NSString stringWithFormat:@"%d° %d' %1.4f\"",
                       degrees, minutes, seconds];
    //save latitude and longitude values are locally
    prefs=[NSUserDefaults standardUserDefaults];
    //kakinada
    [prefs setFloat:newLocation.coordinate.latitude forKey:@"lat"];
    [prefs setFloat:newLocation.coordinate.longitude forKey:@"long"];
    
    // hyderabad
   // [prefs setValue:[NSString stringWithFormat:@"%f",30.3964380] forKey:@"lat"];
   // [prefs setValue:[NSString stringWithFormat:@"%f",-91.1620300] forKey:@"long"];
    
    //CLLocation * geoCoder1 = [[CLLocation alloc] initWithLatitude:16.9740948 longitude:82.173247];
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation: newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark * placemark in placemarks) {
            if([placemark subLocality]!=nil)
                [prefs setValue:[NSString stringWithFormat:@"%@,%@",[placemark subLocality],[placemark locality]] forKey:@"currentlocation"];
            else
                [prefs setValue:[NSString stringWithFormat:@"%@",[placemark locality]] forKey:@"currentlocation"];
            [prefs synchronize];
        }
    }];
    [prefs synchronize];
    lat=nil;
    longt=nil;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
