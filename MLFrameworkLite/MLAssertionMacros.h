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
 @def ML_INIT_DISABLED
 Marks an init method as disabled.
 Helpful when trying to indicate that the designated initializer has been replaced by another means of building instances
 for this class.
 
 Example on the .h file:
 @code
 - (instancetype)init ML_INIT_DISABLED;
 @endcode
 */
#define ML_INIT_DISABLED \
	__attribute__((unavailable("Init method has been superceeded, check code & documentation for alternatives.")))



#pragma mark - Multithreading

/*!
 @def ML_ASSERT_MAIN_THREAD
 Asserts that the code is running on the current thread.
 */
#define ML_ASSERT_MAIN_THREAD \
	NSAssert([NSThread currentThread].isMainThread, @"Should me on main thread. Running instead on %@", [NSThread currentThread])


/*!
 @def Annotates a Template Method that has to be implemented by a subclass.
 Example of use in .m file:
 @code
 - (void)templateMethod MLSubclassResponsability();
 - (BOOL)templateMethodRetuningBoolean MLSubclassResponsability(NO);
 - (id)templateMethodRetuningObject MLSubclassResponsability(nil);
 @code
 */
#define MLSubclassResponsability(RETURN_VALUE) \
	{\
		NSAssert(NO, @"Template method %@ should be implemented by subclass.", NSStringFromSelector(_cmd)); \
		return RETURN_VALUE;\
	}

#endif
