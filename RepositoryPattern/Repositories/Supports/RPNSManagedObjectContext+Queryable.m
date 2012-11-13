//
//  NSManagedObjectContext+Queryable.m
//  ios-queryable
//
//  Created by Marty on 2012-11-07.
//  Copyright (c) 2012 Marty. All rights reserved.
//

#import "RPNSManagedObjectContext+Queryable.h"

@implementation NSManagedObjectContext (Queryable)

-(IQueryable*) ofType:(NSString*)typeName
{
    return [[IQueryable alloc] initWithType:typeName context:self];
}

@end


@interface IQueryable()

@property (strong) NSManagedObjectContext* context;
@property (strong) NSArray* sorts;
@property (strong) NSArray* whereClauses;

@property int skipCount;
@property int takeCount;
@property (strong) NSString* type;

@end


@implementation IQueryable

@synthesize takeCount;
@synthesize skipCount;
@synthesize sorts;
@synthesize whereClauses;
@synthesize context;
@synthesize type;

-(id)initWithType:(NSString *)entityType context:(NSManagedObjectContext*)theContext
{
    self = [super init];
    if(self != nil)
    {
        self.type = entityType;
        self.context = theContext;
        self.takeCount = INT32_MAX;
        self.skipCount = 0;
    }
    
    return self;
}

-(id)initWithType:(NSString*)entityType context:(NSManagedObjectContext*)theContext take:(int)newTake skip:(int)newSkip sorts:(NSArray*)newSorts whereClauses:(NSArray*)newWhereClauses
{
    self = [super init];
    if(self != nil)
    {
        self.type = entityType;
        self.context = theContext;
        self.takeCount = newTake;
        self.skipCount = newSkip;
        self.sorts  = newSorts;
        self.whereClauses = newWhereClauses;
    }
    
    return self;
}

-(NSArray*)toArray
{
    if(self.takeCount <= 0)
        return [[NSArray alloc] init];
    
    int skip = MAX(self.skipCount, 0);

    NSError* error = nil;
    
    NSEntityDescription *entityDescription = [NSEntityDescription
                                              entityForName:self.type
                                              inManagedObjectContext:self.context];
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDescription];

    fetchRequest.sortDescriptors = self.sorts;
    
    [fetchRequest setFetchOffset:skip];
    [fetchRequest setFetchLimit:self.takeCount];
    
    if(self.whereClauses != nil)
        fetchRequest.predicate = [NSCompoundPredicate andPredicateWithSubpredicates:self.whereClauses];
    
    NSArray* results = [self.context executeFetchRequest:fetchRequest error:&error];
    return results;
}

-(NSArray*)add:(id)object toArray:(NSArray*)array
{
    NSMutableArray* a = [NSMutableArray arrayWithArray:array];
    return [a arrayByAddingObject:object];
}

-(IQueryable*) orderBy:(NSString*)fieldName
{
    NSSortDescriptor* descriptor = [[NSSortDescriptor alloc] initWithKey:fieldName ascending:true];
    NSArray* newSorts = [self add:descriptor toArray:self.sorts];
    
    IQueryable* q = [[IQueryable alloc] initWithType:self.type context:self.context take:self.takeCount skip:self.skipCount sorts:newSorts whereClauses:self.whereClauses];
    return q;
}

-(IQueryable*) orderByDescending:(NSString*)fieldName
{
    NSSortDescriptor* descriptor = [[NSSortDescriptor alloc] initWithKey:fieldName ascending:false];
    NSArray* newSorts = [self add:descriptor toArray:self.sorts];
    
    IQueryable* q = [[IQueryable alloc] initWithType:self.type context:self.context take:self.takeCount skip:self.skipCount sorts:newSorts whereClauses:self.whereClauses];
    return q;
}

-(IQueryable*) skip:(int)numberToSkip
{
    IQueryable* q = [[IQueryable alloc] initWithType:self.type context:self.context take:self.takeCount skip:numberToSkip sorts:self.sorts whereClauses:self.whereClauses];

    return q;
}

-(IQueryable*) take:(int)numberToTake
{
    IQueryable* q = [[IQueryable alloc] initWithType:self.type context:self.context take:numberToTake skip:self.skipCount sorts:self.sorts whereClauses:self.whereClauses];
    
    return q;
}

-(IQueryable*)where:(NSString*)condition
{
    NSPredicate* predicate = [NSPredicate predicateWithFormat:condition];
    NSArray* newWheres = [self add:predicate toArray:self.whereClauses];
    
    IQueryable* q = [[IQueryable alloc] initWithType:self.type context:self.context take:self.takeCount skip:self.skipCount sorts:self.sorts whereClauses:newWheres];
    
    return q;
}

-(id)first
{
    id result = [self firstOrDefault];
    if(!result)
        [NSException raise:@"The source sequence is empty" format:@""];
    
    return result;
}

-(id)firstOrDefault
{
    IQueryable* q = [[IQueryable alloc] initWithType:self.type context:self.context take:1 skip:self.skipCount sorts:self.sorts whereClauses:self.whereClauses];
    
    NSArray* results = [q toArray];
    if(results.count > 0)
        return [results objectAtIndex:0];
    else
        return nil;
}

@end