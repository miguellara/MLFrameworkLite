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

/*!
 By default this method compares strings literally, pass in \c options from \c NSStringCompareOptions to modify.
 @returns \c YES if the string starts with \c begining, \c NO otherwise.
 */
- (BOOL)ml_startsWith:(NSString *)begining options:(NSStringCompareOptions)options;

/*!
 Convenience method based on \c-ml_startsWith:options: equivalent to passing no options to this method.
 */
- (BOOL)ml_startsWith:(NSString *)begining;

/*!
 Convenience method based on  \c-ml_startsWith:options: for typical search filters.
 @returns \c YES if the string starts with \c search, ignoring casing, diacritics and character width.
		An empty \c search string will always be considered a hit.
 */
- (BOOL)ml_startsWithSearch:(NSString *)search;

@end
