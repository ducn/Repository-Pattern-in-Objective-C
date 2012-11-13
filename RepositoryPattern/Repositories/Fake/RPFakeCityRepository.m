//
//  RPFakeCityRepository.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/13/12.
//
//

#import "RPFakeCityRepository.h"
#import "City.h"
@implementation RPFakeCityRepository
- (void)getCityFeed:(void (^)(NSArray *))success fail:(void (^)(int, NSError *))fail{
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:1];
    for (int i = 0;i<50;i++) {
        City* city = [self create];
        [city setName:[NSString stringWithFormat:@"Fake City %d",i]];
        [result addObject:city];
    }
    success(result);
}
@end
