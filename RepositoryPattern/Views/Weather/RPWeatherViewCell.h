//
//  RPWeatherCell.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import <UIKit/UIKit.h>
#import "Weather.h"
@interface RPWeatherViewCell : UITableViewCell{
    IBOutlet UILabel *lbstatus;
}
@property(nonatomic,assign) Weather *weather;
- (void) bindData;
@end
