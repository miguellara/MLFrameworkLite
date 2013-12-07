//
//  MLFrameworkLiteMultithreadingHelperTests.m
//  MLFrameworkLiteMultithreadingHelperTests
//
//  Created by Miguel Lara on 24/10/13.
//  Copyright (c) 2013 Miguel Lara. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MLMultithreading.h"


@interface MLFrameworkLiteMultithreadingHelperTests : XCTestCase

@end

@implementation MLFrameworkLiteMultithreadingHelperTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMainThreadShouldDispatchOnMainThreadSynchronously
{
	__block BOOL processedInBlock = FALSE;
	MLDispatchOnMainThread(^{
		XCTAssertTrue([NSThread currentThread].isMainThread, @"Dispatching from main thread should hit main thread");
		processedInBlock = TRUE;
	});
	XCTAssertTrue(processedInBlock, @"Block should be performed synchronously");
}

- (void)testOtherThreadShouldDispatchOnMainThreadSynchronously
{
	dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		__block BOOL processedInBlock = FALSE;
		MLDispatchOnMainThread(^{
			XCTAssertTrue([NSThread currentThread].isMainThread, @"Dispatching from main thread should hit main thread");
			processedInBlock = TRUE;
		});
		XCTAssertTrue(processedInBlock, @"Block should be performed synchronously");
	});
}

@end
