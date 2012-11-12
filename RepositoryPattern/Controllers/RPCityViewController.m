//
//  CityViewController.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "RPCityViewController.h"
#import "RPCityViewCell.h"
#import "RPWeatherViewController.h"

@interface RPCityViewController ()

@end

@implementation RPCityViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"My Favorite Cities";
	// Do any additional setup after loading the view.
    [[dbUnitOfWork cityRepository] getCityFeed:^(NSArray *cities) {
        _cities = cities;
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
    return [_cities count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (UITableViewCell*) tableView:tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RPCityViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"RPCityViewCell" owner:nil options:nil] objectAtIndex:0];
    City *city = [_cities objectAtIndex:indexPath.row];
    [cell setCity:city];
    [cell bindData];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    id weather = [[RPWeatherViewController alloc] initWithNibName:@"RPWeatherView" bundle:nil];
    [self.navigationController pushViewController:weather animated:YES];
}
@end
