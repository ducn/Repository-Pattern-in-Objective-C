//
//  RPICityRepository.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import <Foundation/Foundation.h>
#import "RPIRepository.h"

@protocol RPICityRepository <RPIRepository>
- (void) getCityFeed:(void(^)(NSArray/*City*/ *cities))success fail:(void(^)(int statusCode, NSError *error))fail;
@end
