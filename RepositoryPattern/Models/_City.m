//
//  Location.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "_City.h"


@implementation _City

@dynamic toponymName;
@dynamic name;
@dynamic lat;
@dynamic lng;
@dynamic geonameId;
@dynamic countryCode;
@dynamic countryName;
@dynamic fcl;
@dynamic fcode;
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:moc_];
}

@end
