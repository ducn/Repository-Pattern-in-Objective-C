//
//  RPCityRepository.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import <Foundation/Foundation.h>
#import "RPGenericRepository.h"
#import "RPICityRepository.h"
@interface RPCityRepository : RPGenericRepository<RPICityRepository>

@end
