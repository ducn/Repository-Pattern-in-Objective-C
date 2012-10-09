//
//  RPAppDelegate.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 8/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPIDbUnitOfWork.h"

@interface RPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) id<RPIDbUnitOfWork> dbUnitOfWork;
@end
