//
//  MLAssertionMacros.h
//  MLFrameworkLite
//
//  Created by Miguel Lara on 24/10/13.
//  Copyright (c) 2013 Miguel Lara. All rights reserved.
//

#ifndef MLFrameworkLite_MLAssertionMacros_h
#define MLFrameworkLite_MLAssertionMacros_h


#pragma mark - Readability

/*!
 Marks an init method as disabled.
 Helpful when trying to indicate that the designated initializer has been replaced by another means of building instances
 for this class.
 
 Example on the .m file:
 @code
 - (id)init ML_INIT_DISABLED;
 @endcode
 */
#define ML_INIT_DISABLED \
	{ NSAssert(@"Init method has been superceeded in this class, chedk code & documentation for alternatives."); return nil; }



#pragma mark - Multithreading

/*!
 Asserts that the code is running on the current thread.
 */
#define ML_ASSERT_MAIN_THREAD \
	NSAssert([NSThread currentThread].isMainThread, @"Should me on main thread. Running instead on %@", [NSThread currentThread])



#endif
