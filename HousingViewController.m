//
//  HousingViewController.m
//  Southern University
//
//  Created by admin on 02/05/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "HousingViewController.h"

@interface HousingViewController ()

@end

@implementation HousingViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    navTitle=[UIButton buttonWithType:UIButtonTypeCustom];
    navTitle.frame=CGRectMake(0,0,100,30);
    [navTitle setTitle:@"Housings"  forState:UIControlStateNormal];
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
    
    _titleArray=[[NSMutableArray alloc]initWithObjects:@"Boley/Dunn/JonesHall",@"Student Housing",@"Housing",nil];
    _latitudeArray=[[NSMutableArray alloc]initWithObjects:@"30.527146",@"30.527544",@"30.524086", nil];
    _longitudeArray=[[NSMutableArray alloc]initWithObjects:@"-91.198637",@"-91.198186",@"-91.185681", nil];

    [_housingTable reloadData];
}
-(void)buttonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView1 numberOfRowsInSection:(NSInteger)section
{
    return [_titleArray count];
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
    cell.textLabel.text=[_titleArray objectAtIndex:indexPath.row];
    cell.textLabel.font=[UIFont fontWithName:@"OpenSans-Bold" size:12];
    cell.textLabel.numberOfLines=2;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    [pref setValue:[_latitudeArray objectAtIndex:indexPath.row] forKey:@"DepLat"];
    [pref setValue:[_longitudeArray objectAtIndex:indexPath.row] forKey:@"DepLang"];
    
    float lat=[pref floatForKey:@"lat"];
    float lang= [pref floatForKey:@"long"];
    
   // NSString  *url = [NSString stringWithFormat:@"https://maps.apple.com/?saddr=%f,%f&daddr=%f,%f&dirflg=d&&sll=1450&t=h",lat,lang,[[pref valueForKey:@"DepLat"] floatValue] ,[[pref valueForKey:@"DepLang"] floatValue]];
    NSString  *url = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%f,%f&daddr=%f,%f&z=20&t=k&hl=en_US",lat,lang,[[pref valueForKey:@"DepLat"] floatValue] ,[[pref valueForKey:@"DepLang"] floatValue]];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    /// [self performSegueWithIdentifier:@"mapview" sender:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}@end
