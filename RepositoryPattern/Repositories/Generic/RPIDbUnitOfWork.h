//
//  RPIDbUnitOfWork.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPIRepository.h"
#import "RPICityRepository.h"
#import "RPIWeatherRepository.h"

@protocol RPIDbUnitOfWork
@required
/* Describe your repository property here */
// User repository for User model
@property(nonatomic,strong,readonly) id<RPIRepository> userRepository;
// Photo repository for Photo model
@property(nonatomic,strong,readonly) id<RPIRepository> photoRepository;
// City repository for City model
@property(nonatomic,strong,readonly) id<RPICityRepository> cityRepository;
// Weather repository for Weather model
@property(nonatomic,strong,readonly) id<RPIWeatherRepository> weatherRepository;

- (void) saveChanges;
+ (id<RPIDbUnitOfWork>) sharedInstance;
@end
