//
//  PersonViewController.h
//  Southern University
//
//  Created by admin on 02/05/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonViewController : UIViewController
{
    IBOutlet UIBarButtonItem *revealButtonItem21;
    IBOutlet UIButton *navTitle;
    NSMutableArray *persons,*searchPersons;
    BOOL searching;
    IBOutlet UISearchBar *searchBar;

}
@property(nonatomic,strong)IBOutlet UITableView *personTable;
@property(nonatomic,strong)IBOutlet NSMutableArray *titleArray,*phoneNumbers,*latitudeArray,*longetudeArray,*lastnameArray;
@end
