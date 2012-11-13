//
//  Location.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseManagedObjectModel.h"

@interface _City : BaseManagedObjectModel

@property (nonatomic, retain) NSString * toponymName;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * lat;
@property (nonatomic, retain) NSNumber * lng;
@property (nonatomic, retain) NSNumber * geonameId;
@property (nonatomic, retain) NSString * countryCode;
@property (nonatomic, retain) NSString * countryName;
@property (nonatomic, retain) NSString * fcl;
@property (nonatomic, retain) NSString * fcode;
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
@end
