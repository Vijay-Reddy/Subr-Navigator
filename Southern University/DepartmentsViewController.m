//
//  DepartmentsViewController.m
//  Southern University
//
//  Created by admin on 02/05/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "DepartmentsViewController.h"
#import "Departments.h"
@interface DepartmentsViewController ()

@end

@implementation DepartmentsViewController
@synthesize latitudeArray,longitudeArray,titleArray;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    searchBar.showsCancelButton=NO;

    navTitle=[UIButton buttonWithType:UIButtonTypeCustom];
    navTitle.frame=CGRectMake(0,0,100,30);
    [navTitle setTitle:@"Departments"  forState:UIControlStateNormal];
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
    titleArray=[[NSMutableArray alloc]initWithObjects:@"Department of Curriculum and Instruction",@"Department of EducationalTheory, Policy and Practice (Graduate Programs)",@"Department of Mass Communications",@"Department of English, World Languages, and History",@"Department of Visual and Performing Arts",@"Department of Accounting Finance and Economics",@"Department of Management and Marketing",@"Department of Business Administration (MBA)",@"Department of Civil and Environmental Engineering",@"Department of Mechanical Engineering",@"Department of Electrical Engineering and Electronic Engineering",@"Department of Computer Science",@"Department of Behavioral Studies",@"Department of Social Sciences",@"Nelson Mandela School of Public Policy",@"Department of Agricultural Sciences and Urban Forestry",@"Department of Biological Sciences, Chemistry, and Environmental Toxicology",@"Department of Mathematics, Physics and Math/Science Education",@"Department of Family and Consumer Sciences",@"School of Nursing",@"Department of Speech-Language Pathology",@"Department of Rehabilitation Counseling",@"Department of Therapeutic Recreation & Leisure Studies",@"Law Center",@"Graduate School",@"Honors College",@"Air Force ROTC",@"Military Science Army ROTC",@"Naval Science Navy ROTC",nil];
    latitudeArray=[[NSMutableArray alloc]initWithObjects:@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.525851",@"30.525851",@"30.525851",@"30.524593",@"30.524593",@"30.524593",@"30.52515",@"30.523492",@"30.523492",@"30.523492",@"30.52988",@"30.524882",@"30.525851",@"30.523694",@"30.523763",@"30.523763",@"30.523763",@"30.523763",@"30.5236761",@"30.52168",@"30.525294",@"30.5238495",@"30.5238495",@"30.523818",nil];
    longitudeArray=[[NSMutableArray alloc]initWithObjects:@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.192141",@"-91.193551",@"-91.193551",@"-91.193551",@"-91.191006",@"-91.192289",@"-91.19202",@"-91.19268",@"-91.18997",@"-91.18997",@"-91.18997",@"-91.18997",@"-91.1944502",@"-91.193287",@"-91.190687",@"-91.1973485",@"-91.1973485",@"-91.198131", nil];
    
    departments=[[NSMutableArray alloc]init];
    for(int i=0;i<[titleArray count];i++)
    {
        Departments *person = [Departments new];
        person.dname = [titleArray objectAtIndex:i];
        person.dlat = [latitudeArray objectAtIndex:i];
        person.dlongt =[longitudeArray objectAtIndex:i];
        [departments addObject:person];
    }
    NSArray *sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"dname" ascending:YES]];
    NSArray *brforeSorting=[departments mutableCopy];
    NSArray *sortedArray = [brforeSorting sortedArrayUsingDescriptors:sortDescriptors];
    departments=[sortedArray mutableCopy];
    [_departTable reloadData];
}

-(void)buttonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView1 numberOfRowsInSection:(NSInteger)section
{
    if(searching)
    {
      return [searchDepartments count];
    }
    return [departments count];
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
    
    Departments *person;
    if (searching)
    {
        person = [searchDepartments objectAtIndex:indexPath.row];
    } else
    {
        person = [departments objectAtIndex:indexPath.row];
    }
    cell.textLabel.text=person.dname;
    cell.textLabel.font=[UIFont fontWithName:@"OpenSans-Bold" size:12];
    cell.textLabel.numberOfLines=2;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar1
{
    [searchBar resignFirstResponder];
}// called when keyboard search button pressed
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar1
{
    searchBar.showsCancelButton=YES;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar1
{
    [searchBar resignFirstResponder];
    searchBar.showsCancelButton=NO;
    searching=FALSE;
    [_departTable reloadData];
    searchBar.text=@"";
    
}
// called when text starts editing
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar1
{
    searchBar.showsCancelButton=NO;
    
    searching=FALSE;
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    searching=YES;
    NSLog(@"test");
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"dname CONTAINS[c] %@", searchText];
    
  //  [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^\\d.+"];
    searchDepartments = [[departments filteredArrayUsingPredicate:resultPredicate] mutableCopy];
    [_departTable reloadData];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Departments *person;
    if (searching)
    {
        person = [searchDepartments objectAtIndex:indexPath.row];
    } else
    {
        person = [departments objectAtIndex:indexPath.row];
    }
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    [pref setValue:person.dlat forKey:@"DepLat"];
    [pref setValue:person.dlongt forKey:@"DepLang"];
    
    float lat=[pref floatForKey:@"lat"];
    float lang= [pref floatForKey:@"long"];
    
    //z is the zoom level (1-20)
   // t is the map type ("m" map, "k" satellite, "h" hybrid, "p" terrain, "e" GoogleEarth)
    
  NSString  *url = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%f,%f&daddr=%f,%f&z=20&t=k&hl=en_US",lat,lang,[[pref valueForKey:@"DepLat"] floatValue] ,[[pref valueForKey:@"DepLang"] floatValue]];
    
  //  NSString  *url = [NSString stringWithFormat:@"https://maps.apple.com/?saddr=%f,%f&daddr=%f,%f&dirflg=d&&sll=1450&t=k",lat,lang,[[pref valueForKey:@"DepLat"] floatValue] ,[[pref valueForKey:@"DepLang"] floatValue]];
    
 //    NSString *url = [NSString stringWithFormat:@"https://maps.google.com/?saddr=%@,%@&daddr=%@,%@", @"30.7046", @"76.7179", @"30.4414", @"76.1617"];

     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    //[self performSegueWithIdentifier:@"mapview" sender:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
