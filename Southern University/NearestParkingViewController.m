//
//  NearestParkingViewController.m
//  Southern University
//
//  Created by vamsiaruna on 9/19/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "NearestParkingViewController.h"

@interface NearestParkingViewController ()

@end

@implementation NearestParkingViewController

- (void)viewDidLoad
{
    
//https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&type=parking&key=YOUR_API_KEY
    
    
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&radius=5000&type=parking&key=AIzaSyAzaPOr0DrKHY7VlysEbw0nR5UamXA5AyM&nextpage=0",[[pref valueForKey:@"lat"] floatValue],[[pref valueForKey:@"long"] floatValue]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          if(data!=nil)
          {
              NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
              //                  googlePlaceId=[[result valueForKey:@"results"] valueForKey:@"place_id"];
              //                  googleNames=[[result valueForKey:@"results"] valueForKey:@"name"];
              //                  googleAddress=[[result valueForKey:@"results"] valueForKey:@"vicinity"];
              nearPlaces=[result valueForKey:@"results"];
              
          }
          dispatch_async(dispatch_get_main_queue(), ^{
              //   [HUD hide:YES];
              [nearparkingTableView reloadData];
          });
      }] resume];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView1 numberOfRowsInSection:(NSInteger)section
{
    
    return [nearPlaces count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Nearest Parking";
}
-(UITableViewCell *)tableView:(UITableView *)
tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    NSArray *array=[nearPlaces objectAtIndex:indexPath.row];
   
    cell.textLabel.text=[array valueForKey:@"name"];
    cell.textLabel.font=[UIFont fontWithName:@"OpenSans-Bold" size:12];
    cell.textLabel.numberOfLines=2;
    cell.accessoryType=UITableViewCellAccessoryNone;
    cell.textLabel.textColor=[UIColor darkGrayColor];

    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *array=[nearPlaces objectAtIndex:indexPath.row];
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    [pref setValue:[[[array valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lat"] forKey:@"ParkLat"];
    [pref setValue:[[[array valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lng"] forKey:@"ParkLang"];
    [pref synchronize];
    float lat=[pref floatForKey:@"lat"];
    float lang= [pref floatForKey:@"long"];
    
    // [self performSegueWithIdentifier:@"parkingView" sender:nil];
    
    //NSString  *url = [NSString stringWithFormat:@"https://maps.apple.com/?saddr=%f,%f&daddr=%f,%f&dirflg=d&&sll=1450&t=h",lat,lang,[[pref valueForKey:@"ParkLat"] floatValue] ,[[pref valueForKey:@"ParkLang"] floatValue]];
    NSString  *url = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%f,%f&daddr=%f,%f&z=20&t=k&hl=en_US",lat,lang,[[pref valueForKey:@"ParkLat"] floatValue] ,[[pref valueForKey:@"ParkLang"] floatValue]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}
- (void)didReceiveMemoryWarning
{
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
