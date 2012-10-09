//
//  RPGenericRepository.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPIRepository.h"
#import "RPIDbContext.h"

@interface RPGenericRepository :NSObject<RPIRepository>{
    id<RPIDbContext> dbContext;
    Class modelClass;
}
- (id) initWithDbContext:(id<RPIDbContext>) context withModel:(Class)modeClass;
@end
