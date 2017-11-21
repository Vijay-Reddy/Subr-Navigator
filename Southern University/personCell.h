//
//  personCell.h
//  Southern University
//
//  Created by admin on 7/9/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface personCell : UITableViewCell
@property(nonatomic,strong)IBOutlet UILabel *name;
@property(nonatomic,strong)IBOutlet UIButton *call,*map;
@end
