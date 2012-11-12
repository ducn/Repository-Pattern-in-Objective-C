//
//  _Photo.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseManagedObjectModel.h"

@interface _Photo : BaseManagedObjectModel

@property (nonatomic, retain) NSNumber * photoId;
@property (nonatomic, retain) NSString * thumbUrl;
@property (nonatomic, retain) NSString * medUrl;
@property (nonatomic, retain) NSString * largeUrl;

@end
