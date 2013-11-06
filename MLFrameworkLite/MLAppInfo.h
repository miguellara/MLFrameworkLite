//
//  MLAppInfoMacros.h
//  MLFrameworkLite
//
//  Created by Miguel Lara on 06/11/13.
//  Copyright (c) 2013 Miguel Lara. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_INLINE NSString * MLAppName()
{
	return [[NSProcessInfo processInfo] processName];
}
