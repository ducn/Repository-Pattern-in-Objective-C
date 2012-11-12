//
//  RPMockUnitOfWork.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import <Foundation/Foundation.h>
#import "RPIDbUnitOfWork.h"
#import "RPIDbContext.h"
#import "RPUserMockRepository.h"
#import "RPCoreDataContext.h"
#import "User.h"
#import "Photo.h"

@interface RPMockUnitOfWork : NSObject<RPIDbUnitOfWork>{
    id<RPIDbContext> dbContext;
}

@end
