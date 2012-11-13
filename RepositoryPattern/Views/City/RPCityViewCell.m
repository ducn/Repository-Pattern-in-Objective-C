//
//  RPCityViewCell.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "RPCityViewCell.h"

@implementation RPCityViewCell

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    return self;
}
- (void)bindData{
    cityName.text = self.city.name;
}
@end
