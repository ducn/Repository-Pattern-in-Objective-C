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
@property(nonatomic,strong,readonly) id<RPIRepository> userRepository;
@property(nonatomic,strong,readonly) id<RPIRepository> photoRepository;
@property(nonatomic,strong,readonly) id<RPICityRepository> cityRepository;
@property(nonatomic,strong,readonly) id<RPIWeatherRepository> weatherRepository;

- (void) saveChanges;
+ (id<RPIDbUnitOfWork>) sharedInstance;
@end
