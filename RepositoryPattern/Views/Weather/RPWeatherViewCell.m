//
//  RPWeatherCell.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "RPWeatherViewCell.h"

@implementation RPWeatherViewCell

- (void)bindData{
    lbstatus.text = self.weather.stationName;
}

@end
