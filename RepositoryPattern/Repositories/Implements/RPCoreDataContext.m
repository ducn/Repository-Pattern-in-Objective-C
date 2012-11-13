//
//  RPDataContext.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RPCoreDataContext.h"
#import "RPNSManagedObjectContext+Queryable.h"
#import "User.h"
@implementation RPCoreDataContext

dispatch_queue_t background_save_queue(void);

static dispatch_queue_t coredata_background_save_queue;

dispatch_queue_t background_save_queue()
{
    if (coredata_background_save_queue == NULL)
    {
        coredata_background_save_queue = dispatch_queue_create("com.coredata.backgroundsaves", 0);
    }
    return coredata_background_save_queue;
}


#pragma mark - Utils
-(NSMutableArray *)searchObjects:(NSString*)entityName 
                       predicate:(NSPredicate*)predicate 
                         sortKey:(NSString*)sortKey
                   sortAscending:(BOOL)sortAscending {
 
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:_foregroundObjectContext];
    [request setEntity:entity];	

    if(predicate != nil) {
        [request setPredicate:predicate];
    }

    if(sortKey != nil) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortKey ascending:sortAscending];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [request setSortDescriptors:sortDescriptors];
    }

    NSError *error;
    NSMutableArray *mutableFetchResults = [[_foregroundObjectContext executeFetchRequest:request error:&error] mutableCopy];
    return mutableFetchResults;
}

-(NSMutableArray *)getObjects:(NSString*)entityName sortKey:(NSString*)sortKey sortAscending:(BOOL)sortAscending {	
	return [self searchObjects:entityName
                     predicate:nil
                       sortKey:sortKey
                 sortAscending:sortAscending];
}

-(void)removeAllEntities:(NSString*)entityName {
    
    NSFetchRequest * allEntities = [[NSFetchRequest alloc] init];
    [allEntities setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:_foregroundObjectContext]];
    [allEntities setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError * error = nil;
    NSArray * entities = [_foregroundObjectContext executeFetchRequest:allEntities error:&error];
    for (NSManagedObject * entity in entities) {
        [_foregroundObjectContext deleteObject:entity];
    }
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = _foregroundObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}


#pragma mark - Protocol implementation
- (NSArray*)getObjects:(Class)modelClass{
    return [self getObjects:[modelClass description] sortKey:nil sortAscending:FALSE];
}
- (id)attachObject:(Class)modelClass{
    return [NSEntityDescription insertNewObjectForEntityForName:[modelClass description] inManagedObjectContext:_foregroundObjectContext];
}

- (void)removeManagedObject:(id)managedObject{
    [_foregroundObjectContext deleteObject:managedObject];
}

- (void)saveChanges{
    [self saveContext];
}

- (void)asyncUpdateWithContext:(void (^)(NSManagedObjectContext *context))startUpdate completion:(void (^)())completion{
    
    startUpdate(_backgroundObjectContext);
    
    NSError *error = nil;
    if (_backgroundObjectContext != nil)
    {
        if ([_backgroundObjectContext hasChanges] && ![_backgroundObjectContext save:&error])
        {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    if (completion)
    {
        dispatch_async(dispatch_get_main_queue(), completion);
    }

}

- (NSArray *)find:(NSString *)objectName where:(NSString *)conditions{
    NSArray* result = [[[_foregroundObjectContext ofType:objectName]
                         where:conditions] toArray];
    return result;
    
}

- (NSArray *)find:(NSString *)objectName where:(NSString *)conditions take:(int)countItem{
    NSArray* result = [[[[_foregroundObjectContext ofType:objectName]
                        where:conditions] take:countItem] toArray];
    return result;
}

- (NSArray *)find:(NSString *)objectName where:(NSString *)conditions orderBy:(NSString *)orderByAttribute ascending:(BOOL)ascending{
    if (ascending) {
        NSArray* result = [[[[_foregroundObjectContext ofType:objectName]
                             where:conditions]
                            orderBy:orderByAttribute] toArray];
        return result;
    }
    else{
        NSArray* result = [[[[_foregroundObjectContext ofType:objectName]
                             where:conditions]
                            orderByDescending:orderByAttribute] toArray];
        return result;
    }
}
- (NSArray *)find:(NSString *)objectName where:(NSString *)conditions orderBy:(NSString *)orderByAttribute ascending:(BOOL)ascending take:(int)countItem{
    if (ascending) {
        NSArray* result = [[[[[_foregroundObjectContext ofType:objectName]
                              where:conditions]
                             orderBy:orderByAttribute]
                            take:countItem]
                           toArray];
        return result;
    }
    else{
        NSArray* result = [[[[[_foregroundObjectContext ofType:objectName]
                              where:conditions]
                             orderByDescending:orderByAttribute]
                            take:countItem]
                           toArray];
        return result;
    }
}


#pragma mark - Core Data stack
/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *) createManagedObjectModel
{
    if (_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:kCoreDataModelName withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *) createPersistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil)
    {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:kSqlLiteDbName];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_managedObjectModel];
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
        
        //NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        //abort();
    }    
    
    return _persistentStoreCoordinator;
}

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (void) createManagedObjectContext
{
    if (_foregroundObjectContext != nil)
    {
        return;
    }
    
    [self createManagedObjectModel];
    
    NSPersistentStoreCoordinator *coordinator = [self createPersistentStoreCoordinator];
    if (coordinator != nil)
    {
        _foregroundObjectContext = [[NSManagedObjectContext alloc] init];
        [_foregroundObjectContext setPersistentStoreCoordinator:coordinator];

        _backgroundObjectContext = [[NSManagedObjectContext alloc] init];
        [_backgroundObjectContext setPersistentStoreCoordinator:coordinator];

        [_foregroundObjectContext setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
        [_backgroundObjectContext setMergePolicy:NSOverwriteMergePolicy];

    }
}



- (id) init{
    self  = [super init];
    if (self) {
        [self createManagedObjectContext];
    }
    return self;
}
@end
