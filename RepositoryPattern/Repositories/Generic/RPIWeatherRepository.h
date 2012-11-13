//
//  RPIWeatherRepository.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import <UIKit/UIKit.h>
#import "RPIRepository.h"

@protocol RPIWeatherRepository<RPIRepository>
- (void) getWeatherFeed:(void(^)(NSArray/*Weather*/ *weather))success fail:(void(^)(int statusCode, NSError *error))fail;
@end
