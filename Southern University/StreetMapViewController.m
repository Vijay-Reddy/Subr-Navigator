//
//  StreetMapViewController.m
//  Southern University
//
//  Created by Mango on 6/4/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "StreetMapViewController.h"
@import GoogleMaps;

@interface StreetMapViewController ()

@end

@implementation StreetMapViewController

- (void)viewDidLoad
{
    CLLocationCoordinate2D panoramaNear = {[[[NSUserDefaults standardUserDefaults] valueForKey:@"Lat"] floatValue] ,[[[NSUserDefaults standardUserDefaults] valueForKey:@"Lang"] floatValue] };
    
    GMSPanoramaView *panoView =
    [GMSPanoramaView panoramaWithFrame:CGRectZero
                        nearCoordinate:panoramaNear];
    
    self.view = panoView;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
