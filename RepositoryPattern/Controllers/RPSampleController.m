//
//  SampleController.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "RPSampleController.h"

@interface RPSampleController ()

@end

@implementation RPSampleController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void) getMockUserInfo{
    id users = [[dbUnitOfWork userRepository] getObjects];
    NSLog(@"%@ users",users);
//    User *user =[[dbUnitOfWork userRepository] newModel];
//    user.name = @"test";
//    user.email = @"test@yahoo.com";
//    [dbUnitOfWork saveChanges];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self getMockUserInfo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
