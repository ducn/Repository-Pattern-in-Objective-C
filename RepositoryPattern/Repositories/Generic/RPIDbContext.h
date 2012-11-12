//
//  RPIDbContext.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RPIDbContext
- (NSArray*)    getObjects:(Class)modelClass;
- (id)          attachObject:(Class) modelClass;
- (void)        removeManagedObject:(id) managedObject;
- (void)        saveChanges;
- (void)        asyncUpdateWithContext:(void(^)(NSManagedObjectContext *context))startUpdate completion:(void(^)())completion;
@end
