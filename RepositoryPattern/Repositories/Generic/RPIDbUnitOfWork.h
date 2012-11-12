//
//  RPIDbUnitOfWork.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPIRepository.h"
#import "RPIUserRepository.h"
@protocol RPIDbUnitOfWork
@required
+ (id<RPIDbUnitOfWork>) sharedInstance;
@property(nonatomic,strong,readonly) id<RPIUserRepository> userRepository;
@property(nonatomic,strong,readonly) id<RPIRepository> photoRepository;
- (void) saveChanges;
@end
