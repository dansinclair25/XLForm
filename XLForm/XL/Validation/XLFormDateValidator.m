//
//  XLFormDateValidator.m
//  Pods
//
//  Created by Dan Sinclair on 03/08/2015.
//
//

#import "XLFormDateValidator.h"

@implementation XLFormDateValidator


- (id)initWithMsg:(NSString*)msg {
    self = [super init];
    if (self) {
        
        self.msg = msg;
    }
    
    return self;
}

+ (XLFormDateValidator *)formDateValidatorWithMsg:(NSString*)msg {
    
    return [[XLFormDateValidator alloc] initWithMsg:msg];
}

-(XLFormValidationStatus *)isValid: (XLFormRowDescriptor *)row {
    if (row != nil && row.value != nil) {
        // we only validate if there is a value
        // assumption: required validation is already triggered
        // if this field is optional, we only validate if there is a value
        
        NSLog(@"%@", row.value);
        
        id value = row.value;
        if ([value isKindOfClass:[NSNumber class]]){
            value = [value stringValue];
        }
        if ([value isKindOfClass:[NSString class]]) {
            if ([value length] != 5) {
                return [XLFormValidationStatus formValidationStatusWithMsg:self.msg status:NO rowDescriptor:row];
            }
            
            NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            NSDateComponents *components = [[NSDateComponents alloc] init];
            components.day = 1;
            components.month = [[value substringToIndex:2] integerValue];
            components.year = 2000 + [[value substringFromIndex:3] integerValue];
            
            NSLog(@"%@", components);
            
            NSDate *exDate = [cal dateFromComponents:components];
            
            if ([exDate laterDate:[NSDate new]] == exDate) {
                return [XLFormValidationStatus formValidationStatusWithMsg:self.msg status:YES rowDescriptor:row];
                
            } else {
                return [XLFormValidationStatus formValidationStatusWithMsg:self.msg status:NO rowDescriptor:row];
            }
            
        }
    }
    return nil;
};


@end
