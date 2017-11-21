//
//  MapViewController.m
//  Southern University
//
//  Created by Mango on 6/4/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "MapViewController.h"
@import GoogleMaps;

@interface MapViewController ()
{
    GMSMapView *mapView_;
    GMSMarker *_markerStart;
    GMSMarker *_markerFinish;
    GMSPolyline *_polyline;

}
@end

@implementation MapViewController

- (void)viewDidLoad
{
    UIImage *image21=[UIImage imageNamed:@"back"];
    UIButton *menu21=[UIButton buttonWithType:UIButtonTypeCustom];
    [menu21 setTitle:@"Navigator" forState:UIControlStateNormal];
    menu21.frame = CGRectMake(0.0, 0.0, 80,44);
    [menu21 addTarget:self action:@selector(navigator) forControlEvents:UIControlEventTouchUpInside];
   UIBarButtonItem *revealButtonItem21 = [[UIBarButtonItem alloc] initWithCustomView:menu21];
    self.navigationItem.rightBarButtonItem=revealButtonItem21;
    //Camera
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    float lat=[pref floatForKey:@"lat"];
    float lang= [pref floatForKey:@"long"];
    GMSCameraPosition *camera =
    [GMSCameraPosition cameraWithLatitude:lat
                                longitude:lang
                                     zoom:20];

    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.mapType = kGMSTypeHybrid;
    
    mapView_.accessibilityElementsHidden = YES;
    mapView_.indoorEnabled = YES;
    

    //mapView.mapType = kGMSTypeSatellite;
  
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(lat, lang);
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.icon = [UIImage imageNamed:@"flag_icon"];
    marker.map = mapView_;
    
    
    GMSMarker *marker1 = [[GMSMarker alloc] init];
    marker1.position = CLLocationCoordinate2DMake([[pref valueForKey:@"DepLat"] floatValue], [[pref valueForKey:@"DepLang"] floatValue]);
    marker1.appearAnimation = kGMSMarkerAnimationPop;
    marker1.icon = [UIImage imageNamed:@"flag_icon"];
    marker1.map = mapView_;
    
    
    [self drawRoute];
    self.view = mapView_;
    
    
//    CLLocationCoordinate2D panoramaNear = {[[[NSUserDefaults standardUserDefaults] valueForKey:@"Lat"] floatValue] ,[[[NSUserDefaults standardUserDefaults] valueForKey:@"Lang"] floatValue] };
//    
//    GMSPanoramaView *panoView =
//    [GMSPanoramaView panoramaWithFrame:CGRectZero
//                        nearCoordinate:panoramaNear];
//    
//    self.view = panoView;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(IBAction)navigator
{
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    float lat=[pref floatForKey:@"lat"];
    float lang= [pref floatForKey:@"long"];
    
//  [[UIApplication sharedApplication] openURL: [NSURL URLWithString:[NSString stringWithFormat:@"http://maps.apple.com/?saddr=%f,%f&daddr=%f,%f&directionsmode=Drive",lat,lang, [[pref valueForKey:@"DepLat"] floatValue] ,[[pref valueForKey:@"DepLang"] floatValue]]]];
    
//    NSString *url = [NSString stringWithFormat:@"https://maps.apple.com/?saddr=%f,%f&daddr=%f,%f&directionsmode=transit",lat,lang,[[pref valueForKey:@"DepLat"] floatValue] ,[[pref valueForKey:@"DepLang"] floatValue]];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];

//    NSURL *testURL = [NSURL URLWithString:@"comgooglemaps-x-callback://"];
//    if ([[UIApplication sharedApplication] canOpenURL:testURL])
//    {
//        [[UIApplication sharedApplication] canOpenURL:
//         [NSURL URLWithString:@"comgooglemaps-x-callback://"]];
//       // NSURL *directionsURL = [NSURL URLWithString:directionsRequest];
//      //  [[UIApplication sharedApplication] openURL:directionsURL];
//    }
//    else
//    {
//        NSLog(@"Can't use comgooglemaps-x-callback:// on this device.");
//    }
    [self performSegueWithIdentifier:@"navigator" sender:nil];
}
- (void)drawRoute
{
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    float lat=[pref floatForKey:@"lat"];
    float lang= [pref floatForKey:@"long"];
    CLLocation *origin = [[CLLocation alloc] initWithLatitude:lat longitude:lang];
    CLLocation *myDestination = [[CLLocation alloc] initWithLatitude:[[pref valueForKey:@"DepLat"] floatValue] longitude:[[pref valueForKey:@"DepLang"] floatValue]];
    [self fetchPolylineWithOrigin:origin destination:myDestination completionHandler:^(GMSPolyline *polyline)
     {
         if(polyline)
         {
             polyline.strokeWidth = 3;
             polyline.strokeColor = [UIColor redColor];
             polyline.map = mapView_;
         }
     }];
}
- (void)fetchPolylineWithOrigin:(CLLocation *)origin destination:(CLLocation *)destination completionHandler:(void (^)(GMSPolyline *))completionHandler
{
    NSString *originString = [NSString stringWithFormat:@"%f,%f", origin.coordinate.latitude, origin.coordinate.longitude];
    NSString *destinationString = [NSString stringWithFormat:@"%f,%f", destination.coordinate.latitude, destination.coordinate.longitude];
    NSString *directionsAPI = @"https://maps.googleapis.com/maps/api/directions/json?";
    NSString *directionsUrlString = [NSString stringWithFormat:@"%@&origin=%@&destination=%@&mode=driving", directionsAPI, originString, destinationString];
    NSURL *directionsUrl = [NSURL URLWithString:directionsUrlString];
    
    
    NSURLSessionDataTask *fetchDirectionsTask = [[NSURLSession sharedSession] dataTaskWithURL:directionsUrl completionHandler:
                                                 ^(NSData *data, NSURLResponse *response, NSError *error)
                                                 {
                                                     NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                     if(error)
                                                     {
                                                         if(completionHandler)
                                                             completionHandler(nil);
                                                         return;
                                                     }
                                                     
                                                     NSArray *routesArray = [json objectForKey:@"routes"];
                                                     
                                                     GMSPolyline *polyline = nil;
                                                     if ([routesArray count] > 0)
                                                     {
                                                         NSDictionary *routeDict = [routesArray objectAtIndex:0];
                                                         NSDictionary *routeOverviewPolyline = [routeDict objectForKey:@"overview_polyline"];
                                                         NSString *points = [routeOverviewPolyline objectForKey:@"points"];
                                                         GMSPath *path = [GMSPath pathFromEncodedPath:points];
                                                         polyline = [GMSPolyline polylineWithPath:path];
                                                     }
                                                     
                                                     if(completionHandler)
                                                         completionHandler(polyline);
                                                 }];
    [fetchDirectionsTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
