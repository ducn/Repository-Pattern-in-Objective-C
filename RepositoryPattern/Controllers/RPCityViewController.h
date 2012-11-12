//
//  CityViewController.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import <UIKit/UIKit.h>

@interface RPCityViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSArray /*City*/ *_cities;
    IBOutlet UITableView *tableView;
}

@end
