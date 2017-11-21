//
//  ListOfBuildingViewController.m
//  Southern University
//
//  Created by admin on 02/05/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "ListOfBuildingViewController.h"
#import "Buildings.h"
@interface ListOfBuildingViewController ()

@end

@implementation ListOfBuildingViewController
@synthesize latitudeArray,longitudeArray,titleArray;
- (void)viewDidLoad
{
  [super viewDidLoad];
    
    navTitle=[UIButton buttonWithType:UIButtonTypeCustom];
    navTitle.frame=CGRectMake(0,0,100,30);
    [navTitle setTitle:@"List of Buildings"  forState:UIControlStateNormal];
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
    
   titleArray=[[NSMutableArray alloc]initWithObjects:@"MINI DOME (F. G. Clark Activity Center)",@"ARMY ROTC",@"NAVY ROTC",@"RIVERSIDE HALL",@"SU MUSEUM OF ART",@"Donald caryle wade house",@"Administration (Joseph S. Clark Hall)",@"E.N.Mayberry Dining Hall",@"Wallace l.Bradfard Hall",@"J. S. Clark Administration Annex Building",@"T.J.Jemison Student Center",@"Richard Turnley Jr. Credit Union",@"Wesley foundation",@"Clifford Seymour Hall",@"William W.Stewert Hall",@"Southern University Book Store",@"Isaac Greggs Band Hall",@"Tourgee A.Dbose Hall",@"Frank Hayden Hall",@"Pinkie E.Thrift Hall",@"James W.Lee Hall",@"William James Hall",@"James Blaine Moore Hall (TNS Building)",@"Computer Science",@"T.T.Allain Hall",@"A.A Leonier Hall",@"Rodney G.Higgins Hall (Nelson Mandela School of Public policy)",@"Augustus C.Blanks Hall",@"John B.Cade Library",@"T.H. Harris Hall",@"Smith Brown Memorial Union",@"Ashford O.Williams Hall",@"Benjamin Kraft Physical Plant",@"Swine Research Station",@"Central Stores",@"Motor Pool",@"Meat Processing Plant",@"Poultry Science",@"Urban Forestry Green House",@"AG Center Financial Unit",@"T.T.Allain Hall Rear",@"William L.Pass Station University Police",@"Dolores Margaret Richard Spikes Honors College",@"P. B. S. Pinchback Engineering Building",@"Miniature Laboratories",@"J. K. Haynes School of Nursing Building",@"Arnett W.(ACE) MUMFORD Field House",@"J.W.Fisher Hall",@"H. W. Moody Intramural Complex",@"Student Health Center",@"Boley/Dunn/Jones Hall",@"Samuella V.Totty Hall",@"Southern BaseBall Stadium",nil];
    
    latitudeArray=[[NSMutableArray alloc]initWithObjects:@"30.522679",@"30.5238495",@"30.523818",@"30.522485",@"30.5231502",@"30.522487",@"30.521513",@"30.522266",@"30.5207067",@"30.521056",@"30.52012",@"30.519963",@"30.5200457",@"30.5204275",@"30.52212",@"30.521332",@"30.521987",@"30.522593",@"30.5227965",@"30.523694",@"30.5240538",@"30.524744",@"30.524879",@"30.52515",@"30.525851",@"30.5236761",@"30.523492",@"30.5231774",@"30.5232431",@"30.52168",@"30.5221999",@"30.5311014",@"30.5313663",@"30.5309945",@"30.5316568",@"30.53093",@"30.531497",@"30.53003",@"30.52988",@"30.5294659",@"30.525937",@"30.525788",@"30.525294",@"30.524593",@"30.524155",@"30.523763",@"30.523231",@"30.523769",@"30.526706",@"30.525688",@"30.527146",@"30.527544",@"30.520813",nil];
    
longitudeArray=[[NSMutableArray alloc]initWithObjects:@"-91.1855768",@"-91.1973485",@"-91.198131",@"-91.19742",@"-91.197609",@"-91.197406",@"-91.196858",@"-91.196629",@"-91.195675",@"-91.1957264",@"-91.189516",@"-91.190133",@"-91.1881451",@"-91.1919147",@"-91.191772",@"-91.192763",@"-91.1922733",@"-91.192043",@"-91.1922733",@"-91.19268",@"-91.19214",@"-91.19212",@"-91.192322",@"-91.192123",@"-91.19202",@"-91.1944502",@"-91.193551",@"-91.193275",@"-91.1934951",@"-91.193287",@"-91.1935869",@"-91.1907638",@"-91.1931133",@"-91.195303",@"-91.1921608",@"-91.190443",@"-91.1908",@"-91.190435",@"-91.191006",@"-91.1907721",@"-91.191208",@"-91.190959",@"-91.190687",@"-91.190566",@"-91.190617",@"-91.18997",@"-91.189536",@"-91.190747",@"-91.194477",@"-91.1968",@"-91.198637",@"-91.198186",@"-91.184251",nil];
    
    buildings=[[NSMutableArray alloc]init];
    for(int i=0;i<[titleArray count];i++)
    {
        Buildings *person = [Buildings new];
        person.bname = [titleArray objectAtIndex:i];
        person.blat = [latitudeArray objectAtIndex:i];
        person.blongt =[longitudeArray objectAtIndex:i];
        [buildings addObject:person];
    }
    
    NSArray *sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"bname" ascending:YES]];
    NSArray *brforeSorting=[buildings mutableCopy];
    NSArray *sortedArray = [brforeSorting sortedArrayUsingDescriptors:sortDescriptors];
    buildings=[sortedArray mutableCopy];
    [_ListBuildingTable reloadData];
}
-(void)buttonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView1 numberOfRowsInSection:(NSInteger)section
{
    if(searching)
    {
       return [searchbuilings count];
    }
    return [buildings count];
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
    Buildings *person;
    if (searching)
    {
        person = [searchbuilings objectAtIndex:indexPath.row];
    } else
    {
        person = [buildings objectAtIndex:indexPath.row];
    }
    cell.textLabel.text=person.bname;
    cell.textLabel.font=[UIFont fontWithName:@"OpenSans-Bold" size:12];
    cell.textLabel.numberOfLines=2;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Buildings *person;
    if (searching)
    {
        person = [searchbuilings objectAtIndex:indexPath.row];
    } else
    {
        person = [buildings objectAtIndex:indexPath.row];
    }
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    [pref setValue:person.blat forKey:@"DepLat"];
    [pref setValue:person.blongt forKey:@"DepLang"];
    
    float lat=[pref floatForKey:@"lat"];
    float lang= [pref floatForKey:@"long"];
    
  //  NSString  *url = [NSString stringWithFormat:@"https://maps.apple.com/?saddr=%f,%f&daddr=%f,%f&t=k",lat,lang,[[pref valueForKey:@"DepLat"] floatValue] ,[[pref valueForKey:@"DepLang"] floatValue]];
    
    NSString  *url = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%f,%f&daddr=%f,%f&z=20&t=k&hl=en_US",lat,lang,[[pref valueForKey:@"DepLat"] floatValue] ,[[pref valueForKey:@"DepLang"] floatValue]];
    
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
   /// [self performSegueWithIdentifier:@"mapview" sender:nil];
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
    [_ListBuildingTable reloadData];
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
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"bname beginsWith[c] %@", searchText];
    
   // [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^\\d.+"];
    searchbuilings = [[buildings filteredArrayUsingPredicate:resultPredicate] mutableCopy];
    [_ListBuildingTable reloadData];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
