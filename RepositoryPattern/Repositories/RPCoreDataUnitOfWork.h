//
//  RPUnitOfWork.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPIDbUnitOfWork.h"
#import "RPIDbContext.h"
@interface RPCoreDataUnitOfWork : NSObject<RPIDbUnitOfWork>{
    id<RPIDbContext> dbContext;
}

@end
