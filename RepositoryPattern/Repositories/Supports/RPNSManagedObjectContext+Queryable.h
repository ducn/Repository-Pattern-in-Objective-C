//
//  NSManagedObjectContext+Queryable.h
//  ios-queryable
//
//  Created by Marty on 2012-11-07.
//  Copyright (c) 2012 Marty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface IQueryable : NSObject

-(id)initWithType:(NSString*)type context:(NSManagedObject*)theContext;

-(NSArray*) toArray;

-(IQueryable*)orderBy:(NSString*)fieldName;

-(IQueryable*)orderByDescending:(NSString*)fieldName;

-(IQueryable*)skip:(int)numberToSkip;

-(IQueryable*)take:(int)numberToTake;

-(id)first;

-(id)firstOrDefault;

-(IQueryable*) where:(NSString*)condition;

@end


@interface NSManagedObjectContext (Queryable)

-(IQueryable*)ofType:(NSString*)typeName;

@end

