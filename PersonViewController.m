//
//  PersonViewController.m
//  Southern University
//
//  Created by admin on 02/05/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import "PersonViewController.h"
#import "Person.h"
#import "personCell.h"
@interface PersonViewController ()

@end

@implementation PersonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    searchBar.showsCancelButton=NO;

    navTitle=[UIButton buttonWithType:UIButtonTypeCustom];
    navTitle.frame=CGRectMake(0,0,100,30);
    [navTitle setTitle:@"Persons"  forState:UIControlStateNormal];
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
    
    
   
      
    
    
     	
    
    
    _latitudeArray=[[NSMutableArray alloc]initWithObjects:@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.521513",@"30.521513",@"30.521513",@"30.5204275",@"30.5204275",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.5311014",@"30.523769",@"30.523769",@"30.523769",@"30.523769",@"30.523769",@"30.523769",@"30.5238495",@"30.5238495",@"30.521708",@"30.523763",@"30.523763",@"30.523763",@"30.523763",@"30.523763",@"30.521987",@"30.521987",@"30.523492",@"30.523492",@"30.523492",@"30.522266",@"30.522266",@"30.522266",@"30.525788",@"30.525788",@"30.525788",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.524593",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.523492",@"30.523492",@"30.523492",@"30.523694",@"30.523694",@"30.52212",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.521987",@"30.521987",@"30.521987",@"30.521987",@"30.521987",@"30.521987",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.5240538",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.525851",@"30.522593",@"30.522593",@"30.522593",@"30.522593",@"30.522593",@"30.523492",@"30.523492",@"30.523492",@"30.523492",@"30.523492",@"30.523492",@"30.523492",@"30.523492",@"30.523492",@"30.523492",@"30.523492",@"30.523492",@"30.523492",@"30.523492",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.524593",@"30.52168",@"30.52168",@"30.52168",@"30.52168",@"30.52168",@"30.52168",@"30.52168",@"30.52168",@"30.52168",@"30.52168",@"30.52168",@"30.52168",@"30.52168",@"30.52168",@"30.52168",@"30.52168",@"30.52168",@"30.521056",@"30.521056",@"30.521056",@"30.521056",@"30.521056",@"30.521056",@"30.521056",@"30.521056",@"30.521056",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.52212",@"30.523694",@"30.523694",@"30.523694",@"30.523694",@"30.523694",@"30.52988",@"30.52988",@"30.52988",@"30.52988",@"30.52988",@"30.52988",@"30.5232431",@"30.5232431",@"30.5232431",@"30.5232431",@"30.5232431",@"30.5232431",@"30.523763",@"30.523763",@"30.523763",@"30.523763",@"30.52168",@"30.5221999",@"30.5221999",@"30.5221999",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.521513",@"30.5221999",@"30.522679",@"30.522679",@"30.524593",@"30.524593",
                    @"30.525851",
                    @"30.525851",nil];
    
    _longetudeArray=[[NSMutableArray alloc]initWithObjects:@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.1919147",@"-91.1919147",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.1907638",@"-91.190747",@"-91.190747",@"-91.190747",@"-91.190747",@"-91.190747",@"-91.190747",@"-91.1973485",@"-91.1973485",@"-91.197088",@"-91.18997",@"-91.18997",@"-91.18997",@"-91.18997",@"-91.18997",@"-91.1922733",@"-91.1922733",@"-91.193551",@"-91.193551",@"-91.193551",@"-91.196629",@"-91.196629",@"-91.196629",@"-91.190959",@"-91.190959",@"-91.190959",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.193551",@"-91.193551",@"-91.193551",@"-91.19268",@"-91.19268",@"-91.191772",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.1922733",@"-91.1922733",@"-91.1922733",@"-91.1922733",@"-91.1922733",@"-91.1922733",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19214",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.19202",@"-91.192043",@"-91.192043",@"-91.192043",@"-91.192043",@"-91.192043",@"-91.193551",@"-91.193551",@"-91.193551",@"-91.193551",@"-91.193551",@"-91.193551",@"-91.193551",@"-91.193551",@"-91.193551",@"-91.193551",@"-91.193551",@"-91.193551",@"-91.193551",@"-91.193551",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.190566",@"-91.193287",@"-91.193287",@"-91.193287",@"-91.193287",@"-91.193287",@"-91.193287",@"-91.193287",@"-91.193287",@"-91.193287",@"-91.193287",@"-91.193287",@"-91.193287",@"-91.193287",@"-91.193287",@"-91.193287",@"-91.193287",@"-91.193287",@"-91.1957264",@"-91.1957264",@"-91.1957264",@"-91.1957264",@"-91.1957264",@"-91.1957264",@"-91.1957264",@"-91.1957264",@"-91.1957264",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.191772",@"-91.19268",@"-91.19268",@"-91.19268",@"-91.19268",@"-91.19268",@"-91.191006",@"-91.191006",@"-91.191006",@"-91.191006",@"-91.191006",@"-91.191006",@"-91.1934951",@"-91.1934951",@"-91.1934951",@"-91.1934951",@"-91.1934951",@"-91.1934951",@"-91.18997",@"-91.18997",@"-91.18997",@"-91.18997",@"-91.193287",@"-91.1935869",@"-91.1935869",@"-91.1935869",
                     @"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.196858",@"-91.1935869",@"-91.1855768",@"-91.1855768", @"-91.190566",@"-91.190566",
                     @"-91.19202",
                     @"-91.19202",nil];
    
    _titleArray=[[NSMutableArray alloc]initWithObjects:@"Cynthia Bryant",@"Evelyn Albert",@"Munir Ali",@"Kim Chavis",@"K. Coleman",@"Janice Crosby",@"John Hainly",@"Rabiul Hasan",@"Vonsha Henderson",@"Ernest Hill",@"Clarence Holmes",@"Joyce Meeks Jones",@"Robbia Kelly",@"Hattie Lacy",@"Angela Lee",@"Cynthia Levy",@"Gregg Lubritz",@"Kevin Maguire",@"Cynthia Manson",@"JoAnn Marx",@"Thomas Morgan",@"David Porter",@"Sumita Roy",@"Ezhamkulam Samkutty",@"Rita Singleton",@"Kirstin Squint",@"Florence Wellons",@"Sandra Williams",@"Anna Woodard",@"Dee Latimer",@"Armstrong Beatrice",@"Jackson, Brenda",@"Sampson, Nicole",@"Hill, Earl",@"Smith, Pamela",@"Augustine, Zanetta",@"Augustine, William",@"Badon, Donna",@"Bandele, Owusu",@"Berhane, Milagro",@"Brown, Linda",@"Brown, Adell",@"Burke, Wanda",@"Butler, Kim",@"Chappell, Chris",@"Chisley, Curtis",@"Coleman, Danielle",@"Collins, Daniel",@"Thomas, Althea",@"Tubbs, Joyce Selders",@"Udoh, Oscar",@"Udoh, Bridget",@"Weir, Kestee",@"Williams, Erica",@"Ferrygood, Cheryl",@"Mclean-Meyinsse, Patricia",@"Miller, Robert",@"Anderson, Yolonda",@"Harris, Antonio",@"Simon, Gary",@"Smith, Sheila",@"Uppu, Rao",@"Walker, Calvin",@"Belding, Thomas",@"Cable, Brett",@"Flood, Patricia",@"Abadie, Mary",@"Barham, Elaine",@"Bator, Sharon",@"Hill, Jacqueline",@"Lavalais, Thais",@"Byrd, Sandra",@"Hart, Lorenzo",@"Albert, Harry",@"Anderson, Donald",@"Jacobs, Jacqulin",@"Johnson, Sam",@"Joseph, Syble",@"Love, Araminta",@"Briggs, Henry",@"Duhe, Myrtis",@"Williams, Floyd",@"Anderson, India",@"Byrd, Joyce",@"Cockrham, Vicky",@"Dennis, Jackie",@"George, Demetria",@"Jefferson, Towanda",@"Lian, Kun",@"Warren, Brian",@"Washington, Samuel",@"Al-Raoush, Riyadh",@"Alshibli, Kahlid",@"Bynum, Veronica",@"Carriere, Patrick A.",@"Denu, Nathaniel",@"Nam, Jin-Won",@"Shin, Hak-Chul",@"Shams, Alaa",@"Onu, Chukwu",@"Banks, Jeneal",@"Goff, Jackie",@"Pledger, Darnell",@"Butler, Doze",@"Johnson, Allison",@"Rosemond, Gail",@"Andrews, Donald",@"Braden, Terrye",@"Brownell, Wede",@"Calvasina, Eugene",@"Clark, Albert",@"Darby, Mary",@"Doherty, Marilyn",@"Holmes, Adelea",@"No, Sung Chul",@"Patterson, Lauri",@"Ramaswamy, Mysore",@"Rey, Melanie",@"Smyser, Michael",@"Thomas, Carlos",@"Toodi, Bhaskar",@"Waters, Melissa",@"Yigletu, Ashagre",@"O'Rourke, Joyce",@"Adams, Brunetta",@"Brown-Hill, Lucreasie",@"Delpit, Lisa",@"Lewis, Sheila",@"Taylor, James",@"Carriere, Patrick",@"Crump, Christina",@"Majlesein, Hamid",@"Peters, Janifer B.",@"Buford, Debbie",@"Sims, Rosemary",@"White, Boris",@"Aikens, Karen",@"Jackson, Ashley",@"Hollins, Tina",@"London, Dedria",@"Alli-Baloqun, Ola",@"Bynum, Latricia",@"Chambliss, Cheryl",@"Clark, Cary",@"Coleman, Patricia",@"Duncan, Lois",@"Johnson, Cynthia",@"Johnson, Jacki",@"Jones, Pamela",@"Robertson, Barbara",@"Taylor, Rosie",@"Trepagnier, Mark",@"Wilinson-Joseph, Laetitica",@"Atkins-Ball, Deidra",@"Awad, Mohamed",@"Beals, Mary",@"Cole, Derek",@"D’Auvergne, Oswald",@"Hatfield, Brenda",@"Samkutty, Pushpa",@"Spencer, Fitzgerald",@"Taylor, Shervia",@"Telles, Caroline",@"Ward, Alice",@"Williams, George",@"Wilson, Gertrude",@"Albert, Carolyn",@"Burton, Sylvester",@"Chriss, Derald",@"Chriss, Sharon",@"Cornell, Gregory",@"Flowers, Greta",@"Hurst, Angela",@"Moore, William",@"Suleiman, Ahmad",@"Williams, Aubrey",@"Allen, Alvin",@"Allen-Roquemore, Deanna",@"Bai, Shuju",@"Betz, Jessie",@"Gray, Marilyn",@"Gwee, Nigel",@"Johnson, Alonzo",@"Hawkins, Kyesha",@"Kandara, Osman",@"Khosravi, Ebrahim",@"Kourouma, Mathieu",@"Malozovsky, Yuriy",@"Moreman, Douglas",@"Salam, Abdus",@"Trivedi, Sudhir",@"Vincent-Finley, Rachel",@"Warren, Ratana",@"Yang, Shizhong",@"Anderson, Warner",@"Chajia, Fatima",@"Cobb, Irma",@"Elliott, Otis Phillip",@"Mandari, Charange",@"Watterson, Katrina",@"Allen, Troy",@"Armstrong, Sharon",@"Baham, Eva",@"Danquah, Francis",@"Jackson, Wanda",@"Anderson, Harry",@"Chemay, Frank",@"Guilbeaux-James, Judy",@"Hobson, Richard",@"Paige-Green, Jacqueline",@"Williams, Oscar",@"Bagayoko, Diola",@"Bobba, Rambabu",@"Doomes, Edward",@"Fan, Jiangdi",@"Guo, Dong Sheng",@"Hasan, Saleem",@"Matthews, James",@"Reese, Terrence",@"Wang, Jin Tong",@"Anderson, Kissie",@"Batiste, Marlena",@"Clark, Deborah",@"Coleman, Ronald",@"Cunningham, Katrina",@"Idowu, Solomon",@"Prabaharan, Raj",@"Robins, Caroline",@"Turner, Paula",@"Cox, Robert",@"Dawson-Euba, Addie",@"Henry, Randell",@"Honeysucker, Joyce",@"Spencer, Earnisteen",@"Addison, Stephone",@"Christian, Ollie",@"Franklin, Mary",@"Spencer, Elouise",@"Borskey, Erma",@"Bowie, Carrie",@"Richardson, Roslyn",@"Yazeed, Carey",@"Anadi, Sunday",@"Bynum, Ramona",@"Cottrell, Christopher",@"Esedo, Kingsley",@"Hines, Revathi",@"Mahadallah, Hassan",@"Bickham, Shaniece",@"Braima, Mahmoud",@"Brown, Marie",@"Johnson, Jacqueline",@"Kabel, Michael",@"Kennedy, Joseph",@"Roberson, Darrell",@"Bhattacharya, Pradeep",@"Cross, James",@"Luo, Jiecai",@"Smith, Kendrick",@"Shaban, Elhag",@"Walker, Ernest",@"Ye, Zhengmao",@"Amini, Abolfazl",@"Arasteh, Davoud",@"Carter, Patricia",@"Randhawa, Manjit",@"Sarkodee-Adoo, Alfred",@"Blevins, Edgar",@"Crosby, Karen",@"Diwan, Ravinder",@"Huang, Chun Ling",@"Jerro, Dwayne",@"Jana, Amitava",@"Kodiyalam, Sanjay",@"Joshi, Ghanashyam",@"Mensah, Patrick",@"Ogunkoya, Yetunde",@"Wang, Cheng-Shung",@"Namwamba, Fulbert",@"Ronald Omwitsa",@"Edwards, Johnie",@"Forkner, Diane",@"Jackson, Carolyn",@"O’Conner, Amanda",@"Powell, Kimberly",@"Wright, Latonya",@"Damien D. Ejigiri",@"Juliette Williams",@"Tisha Walker",@"Batiste, Fredrick",@"Gardner, Camelia",@"Jermaine Proshee",@"Joshua McKnight",@"Felix Cunningham",@"lliyah M. Moore",@"Don Green",@"Vijay Bhasker Reddy, Bhimanapati",@"Cain, Twyana",@"Vanderbilt, Jonas",@"Adams, Marsha",@"Corley, Reshonda",@"Fair, Lisa",@"Porter, Tamika",@"Roberts, Sonia",@"Washington, Ethel",@"Williams, Walter",@"Ali, Munir",@"Burrell, Leona",@"Chavis, Kim",@"Levy, Cynthia",@"Samkutty, Ezhamkulam",@"Stallman, Patricia",@"Wellons, Florence",@"Atkinson, Cheryl",@"Brown-Thomas, Sidyetta",@"Fields, Eva",@"Namwamba, Grace",@"Ricard, Deidra",@"Abdollahi, Kamran",@"Legiandenyi, Thomas",@"Negatu, Asebe",@"Payne, Roosevelt",@"Chin, Kit",@"Peralto, Joyce",@"Banks, Maya",@"Bowersox, Kathlyn",@"Brown, Mildred",@"Coleman, Kaye",@"Proctor, Angela",@"Singh, Elizabeth",@"Brown, Sandra",@"Carmouche, Malinda",@"Taylor, Cheryl",@"Winbush, Hazel",@"Tamara Montgomery",@"Tanisha Cousby",@"Anthony T. Jackson",@"Jael Gordon",
                 @"Ray L. Belton",
                 @"Christopher Brown",
                 @"Ronyelle Ricard",
                 @"Benjamin Pugh",
                 @"Verjanis Peoples",
                 @"Flandus McClinton",
                 @"Michael Stubblefield"
                 @"Luria Young",
                 
                 @"Brandon K. Dumas"
                 
                 @"Roman Banks",
                 @"William Broussardnil",
                 @"Ibekwe, Samuel",
                 @"Mohamadian, Habib",
                 @"Miller, Thomas",
                 @"Irma Farfan, Cobb",nil];
    
    _lastnameArray=[[NSMutableArray alloc]initWithObjects:@"Bryant",@"Albert",@"Ali",@"Chavis",@"Coleman",@"Crosby",@"Hainly",@"Hasan",@"Henderson",@"Hill",@"Holmes",@"Jones",@"Kelly",@"Lacy",@"Lee",@"Levy",@"Lubritz",@"Maguire",@"Manson",@"Marx",@"Morgan",@"Porter",@"Roy",@"Samkutty",@"Singleton",@"Squint",@"Wellons",@"Williams",@"Woodard",@"Latimer",@"Beatrice",@"Brenda",@"Nicole",@"Earl",@"Pamela",@"Zanetta",@"William",@"Donna",@"Owusu",@"Milagro",@"Linda",@"Adell",@"Wanda",@"Kim",@"Chris",@"Curtis",@"Danielle",@"Daniel",@"Althea",@"Joyce Selders",@"Oscar",@"Bridget",@"Kestee",@"Erica",@"Cheryl",@" Patricia",@"Robert",@"Yolonda",@"Antonio",@"Gary",@"Sheila",@" Rao",@"Calvin",@"Thomas",@"Brett",@"Patricia",@"Mary",@"Elaine",@"Sharon",@"Jacqueline",@"Thais",@"Sandra",@"Lorenzo",@"Harry",@"Donald",@"Jacqulin",@"Sam",@"Syble",@"Araminta",@"Henry",@"Myrtis",@"Floyd",@"India",@"Joyce",@"Vicky",@"Jackie",@"Demetria",@"Towanda",@"Kun",@"Brian",@"Samuel",@"Riyadh",@"Kahlid",@"Veronica",@"Patrick A.",@"Nathaniel",@"Jin-Won",@"Hak-Chul",@"Alaa",@"Chukwu",@"Jeneal",@"Jackie",@"Darnell",@"Doze",@"Allison",@"Gail",@"Donald",@"Terrye",@"Wede",@"Eugene",@"Albert",@"Mary",@"Marilyn",@"Adelea",@"Sung Chul",@"Lauri",@"Mysore",@"Melanie",@"Michael",@"Carlos",@"Bhaskar",@"Melissa",@"Yigletu, Ashagre",@"O'Rourke, Joyce",@"Adams, Brunetta",@"Brown-Hill, Lucreasie",@"Delpit, Lisa",@"Lewis, Sheila",@"Taylor, James",@"Carriere, Patrick",@"Crump, Christina",@"Majlesein, Hamid",@"Peters, Janifer B.",@"Buford, Debbie",@"Sims, Rosemary",@"White, Boris",@"Aikens, Karen",@"Jackson, Ashley",@"Hollins, Tina",@"London, Dedria",@"Alli-Baloqun, Ola",@"Bynum, Latricia",@"Chambliss, Cheryl",@"Clark, Cary",@"Coleman, Patricia",@"Duncan, Lois",@"Johnson, Cynthia",@"Johnson, Jacki",@"Jones, Pamela",@"Robertson, Barbara",@"Taylor, Rosie",@"Trepagnier, Mark",@"Wilinson-Joseph, Laetitica",@"Atkins-Ball, Deidra",@"Awad, Mohamed",@"Beals, Mary",@"Cole, Derek",@"D’Auvergne, Oswald",@"Hatfield, Brenda",@"Samkutty, Pushpa",@"Spencer, Fitzgerald",@"Taylor, Shervia",@"Telles, Caroline",@"Ward, Alice",@"Williams, George",@"Wilson, Gertrude",@"Albert, Carolyn",@"Burton, Sylvester",@"Chriss, Derald",@"Chriss, Sharon",@"Cornell, Gregory",@"Flowers, Greta",@"Hurst, Angela",@"Moore, William",@"Suleiman, Ahmad",@"Williams, Aubrey",@"Allen, Alvin",@"Allen-Roquemore, Deanna",@"Bai, Shuju",@"Betz, Jessie",@"Gray, Marilyn",@"Gwee, Nigel",@"Johnson, Alonzo",@"Hawkins, Kyesha",@"Kandara, Osman",@"Khosravi, Ebrahim",@"Kourouma, Mathieu",@"Malozovsky, Yuriy",@"Moreman, Douglas",@"Salam, Abdus",@"Trivedi, Sudhir",@"Vincent-Finley, Rachel",@"Warren, Ratana",@"Yang, Shizhong",@"Anderson, Warner",@"Chajia, Fatima",@"Cobb, Irma",@"Elliott, Otis Phillip",@"Mandari, Charange",@"Watterson, Katrina",@"Allen, Troy",@"Armstrong, Sharon",@"Baham, Eva",@"Danquah, Francis",@"Jackson, Wanda",@"Anderson, Harry",@"Chemay, Frank",@"Guilbeaux-James, Judy",@"Hobson, Richard",@"Paige-Green, Jacqueline",@"Williams, Oscar",@"Bagayoko, Diola",@"Bobba, Rambabu",@"Doomes, Edward",@"Fan, Jiangdi",@"Guo, Dong Sheng",@"Hasan, Saleem",@"Matthews, James",@"Reese, Terrence",@"Wang, Jin Tong",@"Anderson, Kissie",@"Batiste, Marlena",@"Clark, Deborah",@"Coleman, Ronald",@"Cunningham, Katrina",@"Idowu, Solomon",@"Prabaharan, Raj",@"Robins, Caroline",@"Turner, Paula",@"Cox, Robert",@"Dawson-Euba, Addie",@"Henry, Randell",@"Honeysucker, Joyce",@"Spencer, Earnisteen",@"Addison, Stephone",@"Christian, Ollie",@"Franklin, Mary",@"Spencer, Elouise",@"Borskey, Erma",@"Bowie, Carrie",@"Richardson, Roslyn",@"Yazeed, Carey",@"Anadi, Sunday",@"Bynum, Ramona",@"Cottrell, Christopher",@"Esedo, Kingsley",@"Hines, Revathi",@"Mahadallah, Hassan",@"Bickham, Shaniece",@"Braima, Mahmoud",@"Brown, Marie",@"Johnson, Jacqueline",@"Kabel, Michael",@"Kennedy, Joseph",@"Roberson, Darrell",@"Bhattacharya, Pradeep",@"Cross, James",@"Luo, Jiecai",@"Smith, Kendrick",@"Shaban, Elhag",@"Walker, Ernest",@"Ye, Zhengmao",@"Amini, Abolfazl",@"Arasteh, Davoud",@"Carter, Patricia",@"Randhawa, Manjit",@"Sarkodee-Adoo, Alfred",@"Blevins, Edgar",@"Crosby, Karen",@"Diwan, Ravinder",@"Huang, Chun Ling",@"Jerro, Dwayne",@"Jana, Amitava",@"Kodiyalam, Sanjay",@"Joshi, Ghanashyam",@"Mensah, Patrick",@"Ogunkoya, Yetunde",@"Wang, Cheng-Shung",@"Namwamba, Fulbert",@"Ronald Omwitsa",@"Edwards, Johnie",@"Forkner, Diane",@"Jackson, Carolyn",@"O’Conner, Amanda",@"Powell, Kimberly",@"Wright, Latonya",@"Damien D. Ejigiri",@"Juliette Williams",@"Tisha Walker",@"Batiste, Fredrick",@"Gardner, Camelia",@"Jermaine Proshee",@"Joshua McKnight",@"Felix Cunningham",@"lliyah M. Moore",@"Don Green",@"Vijay Bhasker Reddy, Bhimanapati",@"Cain, Twyana",@"Vanderbilt, Jonas",@"Adams, Marsha",@"Corley, Reshonda",@"Fair, Lisa",@"Porter, Tamika",@"Roberts, Sonia",@"Washington, Ethel",@"Williams, Walter",@"Ali, Munir",@"Burrell, Leona",@"Chavis, Kim",@"Levy, Cynthia",@"Samkutty, Ezhamkulam",@"Stallman, Patricia",@"Wellons, Florence",@"Atkinson, Cheryl",@"Brown-Thomas, Sidyetta",@"Fields, Eva",@"Namwamba, Grace",@"Ricard, Deidra",@"Abdollahi, Kamran",@"Legiandenyi, Thomas",@"Negatu, Asebe",@"Payne, Roosevelt",@"Chin, Kit",@"Peralto, Joyce",@"Banks, Maya",@"Bowersox, Kathlyn",@"Brown, Mildred",@"Coleman, Kaye",@"Proctor, Angela",@"Singh, Elizabeth",@"Brown, Sandra",@"Carmouche, Malinda",@"Taylor, Cheryl",@"Winbush, Hazel",@"Tamara Montgomery",@"Tanisha Cousby",@"Anthony T. Jackson",@"Jael Gordon", @"Ray L. Belton",
                    @"Christopher Brown",
                    @"Ronyelle Ricard",
                    @"Benjamin Pugh",
                    @"Verjanis Peoples",
                    @"Flandus McClinton",
                    @"Michael Stubblefield"
                    @"Luria Young",
                    
                    @"Brandon K. Dumas"
                    
                    @"Roman Banks",
                    @"William Broussardnil",
                    @"Ibekwe, Samuel",
                    @"Mohamadian, Habib",
                    @"Miller, Thomas",
                    @"Irma Farfan, Cobb",nil];
    
    _phoneNumbers=[[NSMutableArray alloc]initWithObjects:@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-2870",@"(225) 771-3020",@"(225) 771-5398",@"(225) 771-5399",@"(225) 771-2952",@"(225) 771-5908",@"(225) 771-2591",@"(225) 771-2561",@"(225) 771-2742",@"(225) 771-2752",@"(225) 771-2753",@"(225) 771-4456",@"(225) 771-2244",@"(225) 771-5184",@"(225) 771-5880",@"(225) 771-6239",@"(225) 771-5882",@"(225) 771-6201",@"(225) 771-0218",@"(225) 771-4302",@"(225) 771-5270",@"(225) 771-2090",@"(225) 771-5714",@"(225) 771-6235",@"(225) 771-4394",@"(225) 771-4394",@"(225) 771-4394",@"(225) 771-4394",@"(225) 771-3206",@"(225) 771-3213",@"(225) 771-3205",@"(225) 771-3170",@"(225) 771-2944",@"(225) 771-3204",@"(225) 771-3963",@"(225) 771-3886",@"(225) 771-4540",@"(225) 771-3582",@"(225) 771-2101",@"(225) 771-3420",@"(225) 771-2169",@"(225) 771-3421",@"(225) 771-2195",@"(225) 771-2251",@"(225) 771-2892",@"(225) 771-3953",@"(225) 771-2323",@"(225) 771-5335",@"(225) 771-3583",@"(225) 771-2100",@"(225) 771-2232",@"(225) 771-4347",@"(225) 771-2468",@"(225) 771-3885",@"(225) 771-2812",@"(225) 771-4282",@"(225) 771-428",@"(225) 771-2811",@"(225) 771-2823",@"(225) 771-4615",@"(225) 771-0295",@"(225) 771-5920",@"(225) 771-3790",@"(225) 771-4634",@"(225) 771-3572",@"(225) 771-5777",@"(225) 771-4326",@"(225) 771-5803",@"(225) 771-2112",@"(225) 771-5750",@"(225) 771-4325",@"(225) 771-4717",@"(225) 771-4434",@"(225) 771-3010",@"(225) 771-3505",@"(225) 771-3355",@"(225) 771-5384",@"(225) 771-2763",@"(225) 771-5960",@"(225) 771-5935",@"(225) 771-5964",@"(225) 771-5974",@"(225) 771-5923",@"(225) 771-5191",@"(225) 771-5934",@"(225) 771-5954",@"(225) 771-6229",@"(225) 771-6229",@"(225) 771-6245",@"(225) 771-5955",@"(225) 771-6247",@"(225) 771-5956",@"(225) 771-5957",@"(225) 771-6248",@"(225) 771-4578",@"(225) 771-4880",@"(225) 771-3571",@"(225) 771-5005",@"(225) 771-3944",@"(225) 771-3762",@"(225) 771-4316",@"(225) 771-5291",@"(225) 771-5413",@"(225) 771-3798",@"(225) 771-4380",@"(225) 771-3060",@"(225) 771-4555",@"(225) 771-5806",@"(225) 771-4140",@"(225) 771-2252",@"(225) 771-2806",@"(225) 771-5600",@"(225) 771-5613",@"(225) 771-5624",@"(225) 771-5662",@"(225) 771-5698",@"(225) 771-5701",@"(225) 771-5709",@"(225) 771-5711",@"(225) 771-5763",@"(225) 771-5845",@"(225) 771-5886",@"(225) 771-4552",@"(225) 771-5907",@"(225) 771-3893",@"",@"(225) 771-3012",@"(225) 771-3072",@"(225) 771-0042",@"(225) 771-0043",@"(225) 771-2744",@"(225) 771-2936",@"(225) 771-3096",@"(225) 771-0245",@"(225) 771-3001",@"(225) 771-3130",@"(225) 771-3178",@"(225) 771-3994",@"(225) 771-3709",@"(225) 771-3738",@"(225) 771-3707",@"(225) 771-3731",@"(225) 771-5700",@"(225) 771-3624",@"(225) 771-3743",@"(225) 771-3715",@"(225) 771-3720",@"(225) 771-2454",@"(225) 771-3013",@"(225) 771-3021",@"(225) 771-3063",@"(225) 771-3223",@"(225) 771-3431",@"(225) 771-4570",@"(225) 771-3553",@"(225) 771-3556",@"(225) 771-2739",@"(225) 771-3652",@"(225) 771-3653",@"(225) 771-4382",@"(225) 771-4383",@"(225) 771-4385",@"(225) 771-4484",@"(225) 771-4675",@"(225) 771-3113",@"(225) 771-2996",@"(225) 771-2997",@"(225) 771-2432",@"(225) 771-5801",@"(225) 771-5394",@"(225) 771-6233",@"(225) 771-4673",@"(225) 771-4695",@"(225) 771-4703",@"(225) 771-4804",@"(225) 771-4868",@"(225) 771-3310",@"(225) 771-3307",@"(225) 771-3300",@"(225) 771-3306",@"(225) 771-3301",@"(225) 771-3303",@"(225) 771-3180",@"(225) 771-2493",@"(225) 771-4324",@"(225) 771-6227",@"(225) 771-2006",@"(225) 771-2261",@"(225) 771-2885",@"(225) 771-2452",@"(225) 771-3071",@"(225) 771-5774",@"(225) 771-5848",@"(225) 771-6224",@"(225) 771-2387",@"(225) 771-3668",@"(225) 771-2113",@"(225) 771-5961",@"(225) 771-2808",@"(225) 771-6226",@"(225) 771-4103",@"(225) 771-4108",@"(225) 771-4109",@"(225) 771-4027",@"(225) 771-4143",@"(225) 771-4961",@"(225) 771-4930",@"(225) 771-4907",@"(225) 771-4960",@"(225) 771-4355",@"(225) 771-4356",@"(225) 771-4360",@"(225) 771-4362",@"(225) 771-4559",@"(225) 771-3211",@"(225) 771-4543",@"(225) 771-6277",@"(225) 771-4617",@"(225) 771-4554",@"(225) 771-2479",@"(225) 771-5644",@"(225) 771-2229",@"(225) 771-2198",@"(225) 771-2250",@"(225) 771-2484",@"(225) 771-2545",@"(225) 771-5722",@"(225) 771-5724",@"(225) 771-2539",@"(225) 771-4474",@"(225) 771-2893",@"(225) 771-2926",@"(225) 771-4073",@"(225) 771-3796",@"(225) 771-3727",@"(225) 771-4052",@"(225) 771-3797",@"(225) 771-5023",@"(225) 771-4736",@"(225) 771-4624",@"(225) 771-2073",@"(225) 771-3258",@"(225) 771-3580",@"(225) 771-5792",@"(225) 771-2718",@"(225) 771-5917",@"(225) 771-4193",@"(225) 771-3475",@"(225) 771-3518",@"(225)771-2262",@"(434) 426 7401",@"(225) 771-4314",@"(225) 771-3663",@"(225) 771-4622",@"(225) 771-3664",@"(225) 771-5731",@"(225) 771-3872",@"(225) 771-4199",@"(225) 771-4199",@"(225) 771-4199",@"(225) 771-5812",@"(225) 771-5833",@"(225) 771-5812",@"(225) 333 8734",@"(225) 771-5812",@"(225) 771-5812",@"(225) 771-5812",@"(720)571 9692",@"(225) 771-2040",@"(225) 771-2130",@"(225) 771-5924",@"(225) 771-5932",@"(225) 771-0132",@"(225) 771-5981",@"(225) 771-6221",@"(225) 771-0037",@"(225) 771-4426",@"(225) 771-3610",@"(225) 771-5688",@"(225) 771-3484",@"(225) 771-3623",@"(225) 771-3682",@"(225) 771-3753",@"(225) 771-3714",@"(225) 771-3168",@"(225) 771-4290",@"(225) 771-0243",@"(225) 771-4291",@"(225) 771-2340",@"(225) 771-6291",@"(225) 771-3722",@"(225) 771-6285",@"(225) 771-6290",@"(225) 771-0068",@"(225) 771-3535",@"(225) 771-2776",@"(225) 771-2666",@"(225) 771-2646",@"(225) 771-2671",@"(225) 771-2624",@"(225) 771-2685",@"(225) 771-5145",@"(225) 771-5000",@"(225) 771-2632",@"(225) 771-2663",@"(225) 771-2200",@"(225) 771-2029",@"(225) 771-3922",@"(225) 771-2256",@"(225) 771-5020"
                   @"(225) 771-2360",
                   @"(225) 771-2930",
                   @"(225) 771-5021",
                   @"(225) 771-2360",
                   @"(225) 771-5021",
                   @"(225) 771-3890",
                   @"(225) 771-2360",
                   @"(225) 771-3922",
                   @"(225) 771-5930",
                   @"(225) 771-5930",
                   @"(225) 771-2525",
                   @"(225) 771-5290",
                   @"(225) 771-3030",
                   @"(225) 771-3030",nil];
    
    persons=[[NSMutableArray alloc]init];
    for(int i=0;i<[_titleArray count];i++)
    {
    Person *person = [Person new];
    person.name = [_titleArray objectAtIndex:i];
    person.phoneNumber = [_phoneNumbers objectAtIndex:i];
    NSArray* arrayOfStrings = [[_lastnameArray objectAtIndex:i]  componentsSeparatedByString:@","];
    person.lastname= [arrayOfStrings lastObject];
    person.lat = [_latitudeArray objectAtIndex:i];
    person.longt = [_longetudeArray objectAtIndex:i];
    [persons addObject:person];
    }
    NSArray *sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"lastname" ascending:YES]];
    NSArray *brforeSorting=[persons mutableCopy];
    NSArray *sortedArray = [brforeSorting sortedArrayUsingDescriptors:sortDescriptors];
    persons=[sortedArray mutableCopy];
    [_personTable reloadData];
    
  //  NSLog(@"%luu--%d-%d-%lu",(unsigned long)_latitudeArray.count,_longetudeArray.count,_phoneNumbers.count,(unsigned long)_titleArray.count);
}

-(void)buttonBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView1 numberOfRowsInSection:(NSInteger)section
{
    if (searching)
    {
        return [searchPersons count];
        
    }
    else
    {
    return [persons count];
    }
}
-(UITableViewCell *)tableView:(UITableView *)
tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"person";
  
    personCell *cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
    cell=[[personCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Person *person;
    if (searching)
    {
        person = [searchPersons objectAtIndex:indexPath.row];
    } else
    {
        person = [persons objectAtIndex:indexPath.row];
    }
    //Person *person=[persons objectAtIndex:indexPath.row];
    cell.name.text=person.name;
    cell.name.font=[UIFont fontWithName:@"OpenSans-Bold" size:12];
    cell.name.numberOfLines=2;
    cell.name.textColor=[UIColor blackColor];
    [cell.map addTarget:self action:@selector(map:) forControlEvents:UIControlEventTouchUpInside];
    cell.map.tag=indexPath.row;
    
    [cell.call addTarget:self action:@selector(call:) forControlEvents:UIControlEventTouchUpInside];
    cell.call.tag=indexPath.row;

    
   // cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
   // cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
-(IBAction)call:(UIButton *)sender
{
    Person *person;
    if (searching)
    {
        person = [searchPersons objectAtIndex:sender.tag];
    } else
    {
        person = [persons objectAtIndex:sender.tag];
    }

    NSString *phoneNumber=[NSString stringWithFormat:@"tel:+1%@",person.phoneNumber];
    phoneNumber=[phoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
}
-(IBAction)map:(UIButton *)sender
{
    Person *person;
    if (searching)
    {
        person = [searchPersons objectAtIndex:sender.tag];
    } else
    {
        person = [persons objectAtIndex:sender.tag];
    }
    
    NSUserDefaults *pref=[NSUserDefaults standardUserDefaults];
    [pref setValue:person.lat forKey:@"personLat"];
    [pref setValue:person.longt forKey:@"personLang"];
    
    float lat=[pref floatForKey:@"lat"];
    float lang= [pref floatForKey:@"long"];
    
   // NSString  *url = [NSString stringWithFormat:@"https://maps.apple.com/?saddr=%f,%f&daddr=%f,%f&dirflg=d&&sll=1450&t=h",lat,lang,[[pref valueForKey:@"DepLat"] floatValue] ,[[pref valueForKey:@"DepLang"] floatValue]];
    
    NSString  *url = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%f,%f&daddr=%f,%f&z=20&t=k&hl=en_US",lat,lang,[[pref valueForKey:@"personLat"] floatValue] ,[[pref valueForKey:@"personLang"] floatValue]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
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
    [_personTable reloadData];
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
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"(name beginswith[c] %@ || lastname contains[c] %@)", searchText,searchText];
    
    [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^\\d.+"];
    searchPersons = [[persons filteredArrayUsingPredicate:resultPredicate] mutableCopy];
    [_personTable reloadData];

}

@end
