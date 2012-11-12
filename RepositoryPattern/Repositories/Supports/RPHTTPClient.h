//
//  RPHTTPClient.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "AFHTTPClient.h"

@interface RPHTTPClient : AFHTTPClient
+ (RPHTTPClient*) sharedInstance;
@end
