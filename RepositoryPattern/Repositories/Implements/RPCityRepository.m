//
//  RPCityRepository.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "RPCityRepository.h"
#import "City.h"
@implementation RPCityRepository
- (void)getCityFeed:(void (^)(NSArray *))success fail:(void (^)(int, NSError *))fail{
    
    RPHTTPClient *client = [RPHTTPClient sharedInstance];
    
    NSString *api = @"citiesJSON?north=44.1&south=-9.9&east=-22.4&west=55.2&lang=de&username=demo";
    
    [client getPath:api
         parameters:nil
            success:^(AFHTTPRequestOperation *operation, id responseObject) {
                // Asynchronous update to Database without blocking UI
                [dbContext asyncUpdateWithContext:^(NSManagedObjectContext *backgroundContext) {
                    // The background context is separate context used to saved to DB,
                    // this context will not affect to ui context which used to display UI elements
                    id responseCities = [responseObject objectForKey:@"geonames"];
                    for (NSDictionary *responseCity in responseCities) {
                        // Insert new object to background context
                        City *city = [City insertInManagedObjectContext:backgroundContext];
                        [city updateWithDictionary:responseCity];
                    }
                } completion:^{
                    // Reflect to UI when update finish.
                    NSArray *cities = [self getAll];
                    success(cities);
                }];
                
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        int statusCode = [[operation response] statusCode];
        fail(statusCode,error);
    }];
    
    // Return saved objects to display as real time as possible
    id savedCities = [self getAll];
    success(savedCities);
}
@end
