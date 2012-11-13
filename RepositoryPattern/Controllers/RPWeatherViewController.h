//
//  RPWeatherViewController.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import <UIKit/UIKit.h>
#import "Weather.h"
#import "RPWeatherViewCell.h"

@interface RPWeatherViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UITableView *tableView;
    NSArray /*weather*/ *_weathers;
}

@end
