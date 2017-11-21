//
//  Person.h
//  Southern University
//
//  Created by admin on 7/9/16.
//  Copyright © 2016 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name,*lastname; // name of recipe
@property (nonatomic, strong) NSString *phoneNumber; // preparation time
@property (nonatomic, strong) NSString *lat,*longt; // image filename of recipe
@property (nonatomic, strong) NSArray *ingredients;

@end
