//
//  RPUserMockRepository.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "RPGenericRepository.h"
#import "RPIUserRepository.h"
#import "RPGenericMockRepository.h"
@interface RPUserMockRepository : RPGenericMockRepository<RPIUserRepository>

@end
