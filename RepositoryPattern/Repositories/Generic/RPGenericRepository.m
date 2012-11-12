//
//  RPGenericRepository.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RPGenericRepository.h"

@implementation RPGenericRepository

- (id) initWithDbContext:(id<RPIDbContext>) context withModel:(__unsafe_unretained Class)class{
    self = [super init];
    if (self) {
        dbContext= context;
        modelClass = class;
    }
    return self;
}
- (NSArray *)getObjects{
    return [dbContext getObjects:modelClass];
}

- (id)newModel{
    return [dbContext attachObject:modelClass];
}

- (void)remove:(id)object{
    [dbContext removeManagedObject:object];
}

@end
