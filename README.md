Repository-Pattern-in-Objective-C
=================================

An implementation of [Repository](http://martinfowler.com/eaaCatalog/repository.html) and [Unit Of Work](http://martinfowler.com/eaaCatalog/unitOfWork.html) pattern in Objective-C. This project provide you a template to implement DAO layer in iOS project, including concurrency update database.

How to use it?
=================================

1. Create Model class
---------------------------------
Start creating your model class using Core Data designer or just create a POCO class. Simply, if you created model class using Core Data Desginer, it will inherit from NSManagedObject class, otherwhise you can inherit your own BaseModel class. See model example classes in Models folder.
Add two utility methods to base model class: updateWithDictionary, toDictionary.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------