//
//  RPDataContext.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "RPIDbContext.h"

@interface RPCoreDataContext : NSObject<RPIDbContext>{
    NSManagedObjectContext *_foregroundObjectContext;
    NSManagedObjectContext *_backgroundObjectContext;
    NSManagedObjectModel *_managedObjectModel;
    NSPersistentStoreCoordinator *_persistentStoreCoordinator;
}
@end
