//
//  MLMultithreading.h
//  MLFrameworkLite
//
//  Created by Miguel Lara on 06/11/13.
//  Copyright (c) 2013 Miguel Lara. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_INLINE void MLDispatchOnMainThread(dispatch_block_t block)
{
	if ([NSThread isMainThread])
	{
		block();
	}
	else
	{
		dispatch_sync(dispatch_get_main_queue(), block);
	}
	
}
