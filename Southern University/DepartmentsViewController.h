//
//  DepartmentsViewController.h
//  Southern University
//
//  Created by admin on 02/05/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DepartmentsViewController : UIViewController
{
    IBOutlet UIBarButtonItem *revealButtonItem21;
    IBOutlet UIButton *navTitle;
    IBOutlet UISearchBar *searchBar;
    BOOL searching;
    NSMutableArray *departments,*searchDepartments;
}
@property(nonatomic,strong)IBOutlet UITableView *departTable;
@property(nonatomic,strong)IBOutlet NSMutableArray *titleArray,*latitudeArray,*longitudeArray;
@end
