//
//  BaseManagedObjectModel.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import <CoreData/CoreData.h>
@interface BaseManagedObjectModel : NSManagedObject
- (void) updateWithDictionary:(NSDictionary*)dictionary;
- (NSDictionary *)toDictionary;
@end
