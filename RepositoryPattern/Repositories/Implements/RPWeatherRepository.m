//
//  RPWeatherRepository.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "RPWeatherRepository.h"
#import "Weather.h"

@implementation RPWeatherRepository

- (void)getWeatherFeed:(void (^)(NSArray *))success fail:(void (^)(int, NSError *))fail{
    RPHTTPClient *client = [RPHTTPClient sharedInstance];
    NSString *api = @"weatherJSON?north=44.1&south=-9.9&east=-22.4&west=55.2&username=demo";
    [client getPath:api
         parameters:nil
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSArray *items = [responseObject objectForKey:@"weatherObservations"];
                NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:1];
                // Just fetch items without insert to DB
                for (NSDictionary *item in items) {
                    Weather *weather = [[Weather alloc] init];
                    [weather updateWithDictionary:item];
                    [result addObject:weather];
                }
                 success(result);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                int statusCode = [[operation response] statusCode];
                fail(statusCode,error);
            }];
}
@end
