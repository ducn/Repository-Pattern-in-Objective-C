//
//  RPUnitOfWork.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RPCoreDataUnitOfWork.h"
#import "RPGenericRepository.h"
#import "RPCoreDataContext.h"
#import "RPICityRepository.h"
#import "RPCityRepository.h"
#import "RPFakeCityRepository.h"
#import "RPWeatherRepository.h"
#import "User.h"
#import "Photo.h"
#import "City.h"

@implementation RPCoreDataUnitOfWork
static id _sharedObject;

-(id) init{
    if (_sharedObject) {
        return _sharedObject;
    }
    else{
        self = [super init];
        if (self) {
            dbContext = [[RPCoreDataContext alloc] init];
        }
        return self;
    }
}

+ (id<RPIDbUnitOfWork>)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedObject = [[RPCoreDataUnitOfWork alloc] init];
    });
    return _sharedObject;
}

- (id<RPIRepository>) userRepository{
    return [[RPGenericRepository alloc] initWithDbContext:dbContext withModel:[User class]];
}

- (id<RPIRepository>) photoRepository{
    return [[RPGenericRepository alloc] initWithDbContext:dbContext withModel:[Photo class]];    
}

- (id<RPICityRepository>) cityRepository{
    /*
        return implemented repository
     */
    return [[RPCityRepository alloc] initWithDbContext:dbContext withModel:[City class]];
    /*
        return Fake Repository
     */
    //return [[RPFakeCityRepository alloc] initWithDbContext:dbContext withModel:[City class]];
}

- (id<RPIWeatherRepository>) weatherRepository{
    return [[RPWeatherRepository alloc] init];
}

- (void)saveChanges{
   [dbContext saveChanges];
}
@end
