//
//  BaseModel.m
//  RepositoryPattern
//
//  Created by Duc Ngo on 11/12/12.
//
//

#import "BaseModel.h"

@implementation BaseModel
- (void)updateWithDictionary:(NSDictionary *)dictionary{
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        id propertyValue = [dictionary valueForKey:(NSString *)propertyName];
        if (propertyValue) {
            [self setValue:propertyValue forKey:propertyName];
        }
    }
    free(properties);
}

- (NSDictionary *)toDictionary{
    unsigned int outCount, i;
    NSMutableDictionary *json = [[NSMutableDictionary alloc] initWithCapacity:1];
    
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue) {
            [json setValue:propertyValue forKey:propertyName];
        }
    }
    free(properties);
    return json;
}
@end
