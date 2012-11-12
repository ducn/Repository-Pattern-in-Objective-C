//
//  RPGenericMockRepository.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import <Foundation/Foundation.h>
#import "RPIDbContext.h"
#import "RPIRepository.h"

@interface RPGenericMockRepository : NSObject<RPIRepository>{
   id<RPIDbContext> dbContext;
   Class modelClass;
}
- (id) initWithDbContext:(id<RPIDbContext>) context withModel:(Class)modeClass;
@end
