//
//  RPGenericMockRepository.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "RPGenericMockRepository.h"

@implementation RPGenericMockRepository
- (id) initWithDbContext:(id<RPIDbContext>) context withModel:(__unsafe_unretained Class)class{
    self = [super init];
    if (self) {
        dbContext= context;
        modelClass = class;
    }
    return self;
}
@end
