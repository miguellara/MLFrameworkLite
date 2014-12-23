//
//  NSString+MLFrameworkLite.m
//  MLFrameworkLite
//
//  Created by Miguel Lara on 04/11/13.
//  Copyright (c) 2013 Miguel Lara. All rights reserved.
//

#import "NSString+MLFrameworkLite.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (MLFrameworkLite)

- (NSString *)ml_stringByTrimmingWhiteSpace
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)ml_isEmpty
{
	return [self ml_stringByTrimmingWhiteSpace].length == 0;
}

- (BOOL)ml_isValidEmailAddress
{
	// RFC 2822
	NSString *emailRegex =
	@"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
	@"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
	@"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
	@"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
	@"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
	@"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
	@"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
	
	NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"self MATCHES[c] %@", emailRegex];
	
	return [emailTest evaluateWithObject:self];
}

- (NSString *)ml_md5String
{
	const char *cstr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cstr, (CC_LONG) strlen(cstr), result);
	
    return [NSString stringWithFormat:
			@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
			result[0u], result[1u], result[2u], result[3u],
			result[4u], result[5u], result[6u], result[7u],
			result[8u], result[9u], result[10u], result[11u],
			result[12u], result[13u], result[14u], result[15u]
			];
}

- (BOOL)ml_startsWith:(NSString *)begining options:(NSStringCompareOptions)options
{
	return [self rangeOfString:begining options:NSAnchoredSearch | options].location != NSNotFound;
}

- (BOOL)ml_startsWith:(NSString *)begining
{
	return [self ml_startsWith:begining options:0];
}

- (BOOL)ml_startsWithSearch:(NSString *)search
{
	if (search.ml_isEmpty) {
		return YES;
	}
	static NSStringCompareOptions const kOptions = (NSCaseInsensitiveSearch
													| NSDiacriticInsensitiveSearch
													| NSWidthInsensitiveSearch);
	return [self ml_startsWith:search options:kOptions];
}

@end
