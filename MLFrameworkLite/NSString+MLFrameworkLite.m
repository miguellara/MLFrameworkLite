//
//  NSString+MLFrameworkLite.m
//  MLFrameworkLite
//
//  Created by Miguel Lara on 04/11/13.
//  Copyright (c) 2013 Miguel Lara. All rights reserved.
//

#import "NSString+MLFrameworkLite.h"

@implementation NSString (MLFrameworkLite)

- (NSString *)ml_stringByTrimmingWhiteSpace
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)ml_isEmpty
{
	return [self ml_stringByTrimmingWhiteSpace].length == 0;
}

@end
