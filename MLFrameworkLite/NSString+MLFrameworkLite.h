//
//  NSString+MLFrameworkLite.h
//  MLFrameworkLite
//
//  Created by Miguel Lara on 04/11/13.
//  Copyright (c) 2013 Miguel Lara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MLFrameworkLite)

- (NSString *)ml_stringByTrimmingWhiteSpace;

/*!
 return YES if the string is empty ignoring white space characters.
 */
- (BOOL)ml_isEmpty;

- (BOOL)ml_isValidEmailAddress;

- (NSString *)ml_md5String;

@end
