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
- (NSArray *)getAll{
    return [dbContext getObjects:modelClass];
}

- (id)create{
    return [dbContext attachObject:modelClass];
}

- (void)remove:(id)object{
    [dbContext removeManagedObject:object];
}

- (NSArray *)find:(NSString *)where{
    return [dbContext find:[modelClass description] where:where];
}
- (NSArray *)find:(NSString *)where take:(int) countItem{
    return [dbContext find:[modelClass description] where:where take:countItem];
}
- (NSArray *)find:(NSString *)where orderBy:(NSString *)orderByAttribute ascending:(BOOL)ascending{
   return [dbContext find:[modelClass description] where:where orderBy:orderByAttribute ascending:ascending];

}
- (NSArray *)find:(NSString *)where orderBy:(NSString *)orderByAttribute ascending:(BOOL)ascending take:(int)countItem{
    return [dbContext find:[modelClass description] where:where orderBy:orderByAttribute ascending:ascending take:countItem];
}
@end
