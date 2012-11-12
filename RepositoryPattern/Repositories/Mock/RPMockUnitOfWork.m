//
//  RPMockUnitOfWork.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "RPMockUnitOfWork.h"

@implementation RPMockUnitOfWork
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
        _sharedObject = [[RPMockUnitOfWork alloc] init];
    });
    return _sharedObject;
}
- (void)saveChanges{
    // Do nothing
}
- (id<RPIUserRepository>)userRepository{
    return [[RPUserMockRepository alloc] initWithDbContext:dbContext withModel:[User class]];
}
- (id<RPIRepository>)photoRepository{
    return [[RPGenericMockRepository alloc] initWithDbContext:dbContext withModel:[Photo class]];
}
@end
