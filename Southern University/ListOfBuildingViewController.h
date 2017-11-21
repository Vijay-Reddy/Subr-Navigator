//
//  ListOfBuildingViewController.h
//  Southern University
//
//  Created by admin on 02/05/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListOfBuildingViewController : UIViewController
{
    IBOutlet UIBarButtonItem *revealButtonItem21;
    IBOutlet UIButton *navTitle;
    NSMutableArray *buildings,*searchbuilings;
    BOOL searching;
    IBOutlet UISearchBar *searchBar;
}
@property(nonatomic,strong)IBOutlet UITableView *ListBuildingTable;
@property(nonatomic,strong)IBOutlet NSMutableArray *titleArray,*latitudeArray,*longitudeArray;
@end
