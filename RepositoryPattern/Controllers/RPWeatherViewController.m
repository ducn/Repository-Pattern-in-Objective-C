//
//  RPWeatherViewController.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "RPWeatherViewController.h"

@interface RPWeatherViewController ()

@end

@implementation RPWeatherViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Weather Feed";
	// Do any additional setup after loading the view.
    [[dbUnitOfWork weatherRepository] getWeatherFeed:^(NSArray *items) {
        _weathers = items;
        [tableView reloadData];
    } fail:^(int statusCode, NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:[error description]
                                                       delegate:nil
                                              cancelButtonTitle:@""
                                              otherButtonTitles:@"OK", nil];
        [alert show];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_weathers count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (UITableViewCell*) tableView:tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RPWeatherViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"RPWeatherViewCell" owner:nil options:nil] objectAtIndex:0];
    Weather *weather = [_weathers objectAtIndex:indexPath.row];
    [cell setWeather:weather];
    [cell bindData];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    id weather = [[RPWeatherViewController alloc] initWithNibName:@"RPWeatherView" bundle:nil];
    [self.navigationController pushViewController:weather animated:YES];
}

@end
