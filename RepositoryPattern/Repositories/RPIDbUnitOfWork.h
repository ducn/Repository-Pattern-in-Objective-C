//
//  RPIDbUnitOfWork.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPIRepository.h"

@protocol RPIDbUnitOfWork
@required
@property(nonatomic,strong,readonly) id<RPIRepository> userRepository;
@property(nonatomic,strong,readonly) id<RPIRepository> photoRepository;
- (void) saveChanges;
@end
