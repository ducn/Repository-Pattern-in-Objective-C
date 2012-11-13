//
//  RPHTTPClient.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "RPHTTPClient.h"
#import "AFJSONRequestOperation.h"

@implementation RPHTTPClient
#define APIURL  @"http://api.geonames.org/"
static RPHTTPClient *_sharedObject;

- (id)init{
    if (_sharedObject) {
        return _sharedObject;
    }
    else{
        self = [super initWithBaseURL:[NSURL URLWithString:APIURL]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        [self setParameterEncoding:AFJSONParameterEncoding];
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        return self;
    }
}

+ (RPHTTPClient *)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedObject = [[RPHTTPClient alloc] init];
    });
    return _sharedObject;
}

@end
