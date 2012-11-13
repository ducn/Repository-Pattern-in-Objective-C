//
//  RPIRepository.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RPIRepository

@required
- (id)          create;
- (NSArray*)    getAll;
- (void)        remove:(id)object;

- (NSArray*)    find:(NSString*)where;
- (NSArray*)    find:(NSString *)where take:(int) countItem;
- (NSArray*)    find:(NSString*)where orderBy:(NSString*)orderByAttribute ascending:(BOOL)ascending;
- (NSArray*)    find:(NSString*)where orderBy:(NSString*)orderByAttribute ascending:(BOOL)ascending take:(int)countItem;
@end
