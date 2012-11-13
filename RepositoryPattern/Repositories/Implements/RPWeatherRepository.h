//
//  RPWeatherRepository.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "RPGenericRepository.h"
#import "RPIWeatherRepository.h"
@interface RPWeatherRepository : RPGenericRepository<RPIWeatherRepository>

@end
