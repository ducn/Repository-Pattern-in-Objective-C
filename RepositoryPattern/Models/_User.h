//
//  _User.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface _User : NSManagedObject

@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * password;

@end
