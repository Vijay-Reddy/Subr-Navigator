//
//  ParkingViewController.h
//  Southern University
//
//  Created by admin on 02/05/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParkingViewController : UIViewController
{
    IBOutlet UIBarButtonItem *revealButtonItem21;
    IBOutlet UIButton *navTitle;
}
@property(nonatomic,strong)IBOutlet UITableView *parkingTable;
@property(nonatomic,strong)IBOutlet NSMutableArray *titleArray,*vistorsLatitude,*visitorsLongitude,*StudentLatitude,*studentLongitude,*stundentsArray,*visitorsArray;
@end
