//
//  MLCompilationMacros.h
//  MLFrameworkLite
//
//  Created by Miguel Lara on 28/02/14.
//  Copyright (c) 2014 Miguel Lara. All rights reserved.
//

#ifndef MLFrameworkLite_MLCompilationMacros_h
#define MLFrameworkLite_MLCompilationMacros_h

#define MLSuppressPerformSelectorLeakWarning(CALL) \
do { \
	_Pragma("clang diagnostic push") \
	_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
	CALL; \
	_Pragma("clang diagnostic pop") \
} while (0)

#endif
