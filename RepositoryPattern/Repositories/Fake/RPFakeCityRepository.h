//
//  RPFakeCityRepository.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/13/12.
//
//

#import "RPGenericRepository.h"
#import "RPICityRepository.h"
@interface RPFakeCityRepository : RPGenericRepository<RPICityRepository>

@end
