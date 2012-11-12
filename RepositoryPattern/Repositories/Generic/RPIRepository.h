//
//  RPIRepository.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RPIRepository
- (id)          newModel;
- (NSArray*)    getObjects;
- (void)        remove:(id)object;
@end
