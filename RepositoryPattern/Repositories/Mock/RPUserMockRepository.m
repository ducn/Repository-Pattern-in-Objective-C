//
//  RPUserMockRepository.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "RPUserMockRepository.h"
#import "User.h"

@implementation RPUserMockRepository

- (NSArray *)getObjects{
    
    // Create fake user 1
    User* user1 = [dbContext attachObject:modelClass];
    [user1 setName:@"Test 1"];
    
    // Create fake user 2
    User* user2 = [dbContext attachObject:modelClass];
    [user2 setName:@"Test 2"];
    
    // Return fake data
    return @[user1,user2];
}

- (id)newModel{
    // Do nothing
    return NULL;
}

-(void)remove:(id)object{
    // Do nothing
}
@end
