//
//  NSStringFrameworkLiteExtensions.m
//  MLFrameworkLite
//
//  Created by Miguel Lara on 07/12/13.
//  Copyright (c) 2013 Miguel Lara. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSString+MLFrameworkLite.h"


@interface NSStringFrameworkLiteExtensions : XCTestCase

@end

@implementation NSStringFrameworkLiteExtensions

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


#pragma mark -ml_stringByTrimmingWhiteSpace

- (void)testEmptyStringShouldBeTrimmedToEmpty
{
	NSString *sut = @"";
	NSString *expectation = @"";
    XCTAssertEqualObjects([sut ml_stringByTrimmingWhiteSpace], expectation, @"Trimmed string should match expectation");
}

- (void)testWhiteSpaceStringShouldBeTrimmedToEmpty
{
	NSString *sut = @"\t  \n";
	NSString *expectation = @"";
    XCTAssertEqualObjects([sut ml_stringByTrimmingWhiteSpace], expectation, @"Trimmed string should match expectation");
}

- (void)testStringWithoutWhiteSpaceShouldNotBeTrimmed
{
	NSString *sut = @"Lorem";
	NSString *expectation = sut;
    XCTAssertEqualObjects([sut ml_stringByTrimmingWhiteSpace], expectation, @"Trimmed string should match expectation");
}

- (void)testStringWithWhiteSpaceBetweenWordsShouldNotBeTrimmed
{
	NSString *sut = @"lorem ipsum";
    NSString *expectation = sut;
    XCTAssertEqualObjects([sut ml_stringByTrimmingWhiteSpace], expectation, @"Trimmed string should match expectation");
}

- (void)testStringWithLeadingWhiteSpaceShouldBeTrimmed
{
	NSString *sut = @"\n\t  lorem";
    NSString *expectation = @"lorem";
    XCTAssertEqualObjects([sut ml_stringByTrimmingWhiteSpace], expectation, @"Trimmed string should match expectation");
}

- (void)testStringWithTrailingWhiteSpaceShouldBeTrimmed
{
	NSString *sut = @"lorem  \n";
    NSString *expectation = @"lorem";
    XCTAssertEqualObjects([sut ml_stringByTrimmingWhiteSpace], expectation, @"Trimmed string should match expectation");
}



#pragma mark -ml_isEmpty tests

- (void)testEmptyStringShouldBeEmpty
{
	NSString *sut = @"";
    XCTAssertTrue([sut ml_isEmpty], @"String should be considered empty");
}

- (void)testWhiteSpaceStringShouldBeEmpty
{
	NSString *sut = @"\t  \n";
    XCTAssertTrue([sut ml_isEmpty], @"String should be considered empty");
}

- (void)testStringWithoutWhiteSpaceShouldNotBeEmpty
{
	NSString *sut = @"lorem";
    XCTAssertFalse([sut ml_isEmpty], @"String should not be considered empty");
}

- (void)testStringWithWhiteSpaceBetweenWordsShouldNotBeEmpty
{
	NSString *sut = @"lorem ipsum";
    XCTAssertFalse([sut ml_isEmpty], @"String should not be considered empty");
}

- (void)testStringWithLeadingWhiteSpaceShouldNotBeEmpty
{
	NSString *sut = @"\n\t  lorem";
    XCTAssertFalse([sut ml_isEmpty], @"String should be considered empty");
}

- (void)testStringWithTrailingWhiteSpaceShouldNotBeEmpty
{
	NSString *sut = @"lorem  \n";
    XCTAssertFalse([sut ml_isEmpty], @"String should be considered empty");
}


@end
