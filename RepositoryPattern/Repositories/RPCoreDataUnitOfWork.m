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
#import "User.h"
#import "Photo.h"

@implementation RPCoreDataUnitOfWork
-(id) init{
    self = [super init];
    if (self) {
        dbContext = [[RPCoreDataContext alloc] init];
    }
    return self;
}
- (id<RPIRepository>) userRepository{
    return [[RPGenericRepository alloc] initWithDbContext:dbContext withModel:[User class]];
}
- (id<RPIRepository>) photoRepository{
    return [[RPGenericRepository alloc] initWithDbContext:dbContext withModel:[Photo class]];    
}
- (void)saveChanges{
    [dbContext saveChanges];
}
@end
