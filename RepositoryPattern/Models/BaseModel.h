//
//  BaseModel.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
- (void)updateWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;
@end
