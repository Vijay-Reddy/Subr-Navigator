//
//  NavigatorViewController.m
//  Southern University
//
//  Created by vamsiaruna on 6/16/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "NavigatorViewController.h"
@import GoogleMaps;

@interface NavigatorViewController ()<GMSPanoramaViewDelegate>

@end

@implementation NavigatorViewController

- (void)viewDidLoad
{
    
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    float lat=[pref floatForKey:@"lat"];
    float lang= [pref floatForKey:@"long"];
    
   // https://www.google.co.uk/maps/@53.8069422,-1.5517854,211m/data=!3m1!1e3
    
    NSString *url = [NSString stringWithFormat:@"https://www.google.com/maps/dir/%f,%f/%f,%f/@%f,%f,211m/data=!3m1!1e3;&amp;ll=START_ADD&sspn=0.2,0.1&nav=1&sensor=true",lat,lang,[[pref valueForKey:@"DepLat"] floatValue] ,[[pref valueForKey:@"DepLang"] floatValue],lat,lang];
    
    url = [NSString stringWithFormat:@"https://maps.apple.com/?saddr=%f,%f&daddr=%f,%f&dirflg=d&&sll=1450&t=h",lat,lang,[[pref valueForKey:@"DepLat"] floatValue] ,[[pref valueForKey:@"DepLang"] floatValue]];
    
    NSURL *myUrl = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];

    
    [navigatorWebView loadRequest:[NSURLRequest requestWithURL:myUrl]];
    
    CLLocationCoordinate2D panoramaNear = {[[[NSUserDefaults standardUserDefaults] valueForKey:@"lat"] floatValue] ,[[[NSUserDefaults standardUserDefaults] valueForKey:@"long"] floatValue] };
    
    GMSPanoramaView *panoView =
    [GMSPanoramaView panoramaWithFrame:CGRectZero
                        nearCoordinate:panoramaNear];
   // panoView.delegate=self;
    
  //  self.view = panoView;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)panoramaView:(GMSPanoramaView *)view didMoveToPanorama:(GMSPanorama *)panorama
{
    NSLog(@"%@",panorama.panoramaID);
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
