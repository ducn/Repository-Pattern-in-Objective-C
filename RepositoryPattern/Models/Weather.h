//
//  Weather.h
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
@interface Weather : BaseModel
@property(nonatomic,strong) NSString* clouds;// "broken clouds",
@property(nonatomic,strong) NSString* weatherCondition;// "haze",
@property(nonatomic,strong) NSString* observation;// "KGRY 120720Z 19019KT 6SM HZ BKN026 BKN032 25/20 A3009 RMK A01 WIND DATA UNRELIABLE",
@property(nonatomic,strong) NSNumber* windDirection;// 190,
@property(nonatomic,strong) NSString* ICAO;// "KGRY",
@property(nonatomic,strong) NSString* cloudsCode;// "BKN",
@property(nonatomic,strong) NSNumber* lng;// -90.45,
@property(nonatomic,strong) NSNumber* temperature;// "25",
@property(nonatomic,strong) NSNumber* dewPoint;// "20",
@property(nonatomic,strong) NSString* weatherConditionCode;// "HZ",
@property(nonatomic,strong) NSNumber* windSpeed;// "19",
@property(nonatomic,strong) NSNumber* humidity;// 73,
@property(nonatomic,strong) NSString* stationName;// "GREEN CANYON 338",
@property(nonatomic,strong) NSDate*   datetime;// "2012-11-12 07;//20;//00",
@property(nonatomic,strong) NSNumber* lat;// 27.633333333333333
@end
