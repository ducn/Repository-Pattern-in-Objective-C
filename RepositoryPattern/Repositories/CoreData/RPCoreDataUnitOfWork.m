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
#import "RPUserRepository.h"
#import "User.h"
#import "Photo.h"

@implementation RPCoreDataUnitOfWork
static id _sharedObject = nil;

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
    static dispatch_once_t pred = 0;
    dispatch_once(&pred, ^{
        _sharedObject = [[RPCoreDataUnitOfWork alloc] init];
    });
    return _sharedObject;
}

- (id<RPIUserRepository>) userRepository{
    return [[RPUserRepository alloc] initWithDbContext:dbContext withModel:[User class]];
}
- (id<RPIRepository>) photoRepository{
    return [[RPGenericRepository alloc] initWithDbContext:dbContext withModel:[Photo class]];
}
- (void)saveChanges{
    [dbContext saveChanges];
}
@end
