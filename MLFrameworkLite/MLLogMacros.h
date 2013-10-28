//
//  MLLogMacros.h
//  MLFrameworkLite
//
//  Created by Miguel Lara on 26/10/13.
//  Copyright (c) 2013 Miguel Lara. All rights reserved.
//

#ifndef MLFrameworkLite_MLLogMacros_h
#define MLFrameworkLite_MLLogMacros_h

#pragma mark - Errors

/*!
 @def MLLogError
 Convenient macro to log an error.
 */
#define MLLogError(ERROR, ACTION, ...) NSLog(@"Error occurred in %@ when %@:\n\t%@", \
											 NSStringFromSelector(_cmd), \
											 [NSString stringWithFormat:ACTION, ##__VA_ARGS__], \
											 ERROR)

#endif
