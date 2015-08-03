//
//  XLFormDateValidator.h
//  Pods
//
//  Created by Dan Sinclair on 03/08/2015.
//
//

#import "XLFormValidatorProtocol.h"
#import "XLFormValidationStatus.h"
#import "XLFormValidator.h"

@interface XLFormDateValidator : XLFormValidator

@property NSString *msg;
@property NSDate *fromDate;
@property NSDate *toDate;

- (id)initWithMsg:(NSString*)msg;
+ (XLFormDateValidator *)formDateValidatorWithMsg:(NSString*)msg


@end
