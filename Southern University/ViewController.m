//
//  ViewController.m
//  Southern University
//
//  Created by admin on 02/05/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    navTitle=[UIButton buttonWithType:UIButtonTypeCustom];
    navTitle.frame=CGRectMake(0,0,100,30);
    [navTitle setTitle:@"Southern University and A&M College"  forState:UIControlStateNormal];
    navTitle.titleLabel.font=[UIFont fontWithName:@"OpenSans-Bold" size:16];
    [navTitle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.navigationItem.titleView=navTitle;
    
    
    
    buildings=[UIButton buttonWithType:UIButtonTypeCustom];
    [buildings setImage:[UIImage imageNamed:@"building1.png"] forState:UIControlStateNormal];
    
    departments=[UIButton buttonWithType:UIButtonTypeCustom];
    [departments setImage:[UIImage imageNamed:@"departments1.png"] forState:UIControlStateNormal];
    
    persons=[UIButton buttonWithType:UIButtonTypeCustom];
    [persons setImage:[UIImage imageNamed:@"person1.png"] forState:UIControlStateNormal];
    
    canteen=[UIButton buttonWithType:UIButtonTypeCustom];
    [canteen setImage:[UIImage imageNamed:@"Food.png"] forState:UIControlStateNormal];
    
    parking=[UIButton buttonWithType:UIButtonTypeCustom];
    [parking setImage:[UIImage imageNamed:@"parking1.png"] forState:UIControlStateNormal];
    
    housing=[UIButton buttonWithType:UIButtonTypeCustom];
    [housing setImage:[UIImage imageNamed:@"Housing1.png"] forState:UIControlStateNormal];
    
    if(self.view.frame.size.height<=568)
    {
        buildings.frame=CGRectMake(10, 120, 110, 110);
        departments.frame=CGRectMake(110, 160, 110, 110);
        persons.frame=CGRectMake(210, 200, 110, 110);
        
        canteen.frame=CGRectMake(10, 260, 100, 110);
        parking.frame=CGRectMake(110, 300, 110, 110);
        housing.frame=CGRectMake(210, 340, 110, 110);
    }
    else
    {
        buildings.frame=CGRectMake(10, 120, 120, 120);
        departments.frame=CGRectMake(130, 160, 120, 120);
        persons.frame=CGRectMake(250, 200, 120, 120);
        
        canteen.frame=CGRectMake(10, 300, 110, 120);
        parking.frame=CGRectMake(130, 340, 120, 120);
        housing.frame=CGRectMake(250, 380, 120, 120);
    }
    [self.view addSubview:buildings];
    [self.view addSubview:departments];
    [self.view addSubview:persons];
    [self.view addSubview:canteen];
    [self.view addSubview:parking];
    [self.view addSubview:housing];
    
    [buildings addTarget:self action:@selector(ListBuildingData) forControlEvents:UIControlEventTouchUpInside];
    
    
    [departments addTarget:self action:@selector(departmentData) forControlEvents:UIControlEventTouchUpInside];
    [persons addTarget:self action:@selector(personData) forControlEvents:UIControlEventTouchUpInside];
    [canteen addTarget:self action:@selector(foodData) forControlEvents:UIControlEventTouchUpInside];
    [parking addTarget:self action:@selector(parkingData) forControlEvents:UIControlEventTouchUpInside];
    [housing addTarget:self action:@selector(housingData) forControlEvents:UIControlEventTouchUpInside];

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    
    
    
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    count=(int)[pref integerForKey:@"homelaunchCount"]+1;
    if(count==5)
    {
        count=1;
        [pref setInteger:count forKey:@"homelaunchCount"];
        UIAlertController *alert= [UIAlertController
                                   alertControllerWithTitle:@"Rate Southern University"
                                   message:@"If you Enjoy using Southern University, Would you mind taking a Movement to rate it? It won't take more than a minute.Thanks for Your Support!"
                                   preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction: [UIAlertAction actionWithTitle:@"Rate APP" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                           {
                               [self gotoReviews];
                           }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"Remind Me Later!" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                          {
                              NSLog(@"Cancel pressed");
                          }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"No Thanks" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action)
                          {
                              NSLog(@"Cancel pressed");
                          }]];
        [self presentViewController:alert animated:YES completion:nil];
    }
    [pref setInteger:count forKey:@"homelaunchCount"];
    [pref synchronize];

}
- (IBAction)gotoReviews
{
    NSString *str = @"https://itunes.apple.com/in/app/secret-calculator-folder-free/id805602170?mt=8";
    str = [NSString stringWithFormat:@"%@/wa/viewContentsUserReviews?", str];
    str = [NSString stringWithFormat:@"%@type=Purple+Software&id=", str];
    
    // Here is the app id from itunesconnect
    str = [NSString stringWithFormat:@"%@yourAppIDHere", str];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}
-(IBAction)ListBuildingData
{
    [self performSegueWithIdentifier:@"ListBuildingData" sender:nil];
}
-(IBAction)departmentData
{
    [self performSegueWithIdentifier:@"departmentData" sender:nil];
}
-(IBAction)personData
{
    [self performSegueWithIdentifier:@"personData" sender:nil];
}
-(IBAction)foodData
{
    [self performSegueWithIdentifier:@"FoodData" sender:nil];
}
-(IBAction)housingData
{
    [self performSegueWithIdentifier:@"HousingData" sender:nil];
}
-(IBAction)parkingData
{
    [self performSegueWithIdentifier:@"ParkingData" sender:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
