//
//  RPCityViewCell.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import <UIKit/UIKit.h>
#import "City.h"
@interface RPCityViewCell : UITableViewCell{
    IBOutlet UILabel *cityName;
}
@property(nonatomic,assign) City *city;
- (void)bindData;
@end
