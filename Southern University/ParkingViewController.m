//
//  ParkingViewController.m
//  Southern University
//
//  Created by admin on 02/05/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "ParkingViewController.h"

@interface ParkingViewController ()

@end

@implementation ParkingViewController
@synthesize titleArray,vistorsLatitude,visitorsLongitude,StudentLatitude,studentLongitude,visitorsArray,stundentsArray;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    navTitle=[UIButton buttonWithType:UIButtonTypeCustom];
    navTitle.frame=CGRectMake(0,0,100,30);
    [navTitle setTitle:@"Parking"  forState:UIControlStateNormal];
    navTitle.titleLabel.font=[UIFont fontWithName:@"OpenSans-Bold" size:16];
    [navTitle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.navigationItem.titleView=navTitle;
    
    UIImage *image21=[UIImage imageNamed:@"back"];
    UIButton *menu21=[UIButton buttonWithType:UIButtonTypeCustom];
    [menu21 setImage:image21 forState:UIControlStateNormal];
    menu21.frame = CGRectMake(0.0, 0.0, image21.size.width, image21.size.height);
    [menu21 addTarget:self action:@selector(buttonBack) forControlEvents:UIControlEventTouchUpInside];
    revealButtonItem21 = [[UIBarButtonItem alloc] initWithCustomView:menu21];
    self.navigationItem.leftBarButtonItem=revealButtonItem21;
    
//    UIButton *menu=[UIButton buttonWithType:UIButtonTypeCustom];
//    [menu setTitle:@"Nearest Parking" forState:UIControlStateNormal];
//    menu.frame = CGRectMake(0.0, 0.0, 150, 40);
//    [menu addTarget:self action:@selector(nearestParking) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:menu];
    
    
    
    
    titleArray=[[NSMutableArray alloc]initWithObjects:@"Students Parking",@"Visitors Parking",nil];
   
    visitorsArray=[[NSMutableArray alloc]initWithObjects:@"Administration Building",@"Mumford Stadium Parking",@"visitor Parking with Passes",@"Student Union Parking",@"T.T.Allian parking",@"Pinchbackparking",@"Temporary parking Permit",@"Urban Forestry Parking",nil];
    
    stundentsArray= [[NSMutableArray alloc]initWithObjects:@"Visitors Parking",@"Temporary parking Permit",@"Mini Dome",@"Pinchback Parking",@"T.T.Allian parking",nil];
    
    
    
    vistorsLatitude=[[NSMutableArray alloc]initWithObjects:@"30.52151",@"30.5226718",@"30.5209042",@"30.5216",@"30.5258743",@"30.525013",@"30.526083",@"30.530297",nil];
    visitorsLongitude=[[NSMutableArray alloc]initWithObjects:@"-91.1970124",@"-91.1882258",@"-91.1926487",@"-91.193624",@"-91.1921606",@"-91.189404",@"-91.191097",@"-91.191824",nil];
    
    StudentLatitude=[[NSMutableArray alloc]initWithObjects:@"30.530297",@"30.526083",@"30.522133",@"30.525013",@"30.5258743",nil];
    studentLongitude=[[NSMutableArray alloc]initWithObjects:@"-91.191824",@"-91.191097",@"-91.186707",@"-91.189404",@"-91.1921606",nil];

    [_parkingTable reloadData];
}
-(void)buttonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView1 numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
    return [stundentsArray count];
    
    return [visitorsArray count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(void)nearestParking
{
    [self performSegueWithIdentifier:@"nearestParking" sender:nil];
}
//- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//    UILabel *sectionHeaderLabel;
//    if( sectionHeaderLabel   ==  nil )
//    {
//        sectionHeaderLabel   =   [[UILabel   alloc] initWithFrame:   CGRectNull];
//    }
//    
//    if(section==0)
//            {
//                sectionHeaderLabel.text=  @"Students Parking";
//            }
//             sectionHeaderLabel.text = @"Visitors Parking";
//    
//    return sectionHeaderLabel;
//}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section==0)
    {
        return @"Students Parking";
    }
    return @"Visitors Parking";
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
    if(indexPath.section==0)
    {
    cell.textLabel.text=[stundentsArray objectAtIndex:indexPath.row];
    }
    else
    {
    cell.textLabel.text=[visitorsArray objectAtIndex:indexPath.row];
    }
    cell.textLabel.textColor=[UIColor darkGrayColor];
    cell.textLabel.font=[UIFont fontWithName:@"OpenSans-Bold" size:12];
    cell.textLabel.numberOfLines=2;
    cell.accessoryType=UITableViewCellAccessoryNone;
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    if(indexPath.section==0)
    {
    [pref setValue:[StudentLatitude objectAtIndex:indexPath.row] forKey:@"ParkLat"];
    [pref setValue:[studentLongitude objectAtIndex:indexPath.row] forKey:@"ParkLang"];
    }
    if(indexPath.section==1)
    {
    [pref setValue:[vistorsLatitude objectAtIndex:indexPath.row] forKey:@"ParkLat"];
    [pref setValue:[visitorsLongitude objectAtIndex:indexPath.row] forKey:@"ParkLang"];
    }
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
@end
