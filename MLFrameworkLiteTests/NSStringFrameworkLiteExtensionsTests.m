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



#pragma mark -ml_isValidEmailAddress tests

- (void)testCorrectEmailAddressIsValid
{
	XCTAssertTrue([@"miguel@mac.com" ml_isValidEmailAddress]);
	XCTAssertTrue([@"MIGUEL@MAC.COM" ml_isValidEmailAddress]);
}

- (void)testEmailAddressWithAdditionIsValid
{
	XCTAssertTrue([@"miguel+1@mac.com" ml_isValidEmailAddress]);
}

- (void)testEmailAddressMissingTheDomainIsInvalid
{
	XCTAssertFalse([@"miguel" ml_isValidEmailAddress]);
}

- (void)testEmailAddressMissingTheUserIsInvalid
{
	XCTAssertFalse([@"@mac" ml_isValidEmailAddress]);
}

- (void)testEmailAddressWithIncompleteDomainIsInvalid
{
	XCTAssertFalse([@"miguel@mac." ml_isValidEmailAddress]);
}

- (void)testEmailAddressWithInvalidCharactersIsInvalid
{
	XCTAssertFalse([@"miguel lara@mac.com" ml_isValidEmailAddress]);
}


#pragma mark -ml_md5String tests

- (void)testMD5String
{
	XCTAssertEqualObjects([@"i digest this" ml_md5String], @"0AEC05EF8873D0E29D398B7506D69B90");
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



#pragma mark -ml_startsWith:options: tests

- (void)testStartsWithOptionsSameStringShouldBeTrueWithDefaultOptions {
	NSString *sut = @"Lorem";
	XCTAssertTrue([sut ml_startsWith:sut options:0], @"\"Lorem\" starts with \"Lorem\"");
}

- (void)testStartsWithOptionsUsesGivenOptions {
	NSString *sut = @"Lorem";
	XCTAssertFalse([sut ml_startsWith:@"lore" options:0], @"\"Lorem\" starts with \"lore\" (case sensitive)");
	XCTAssertTrue([sut ml_startsWith:@"lore" options:NSCaseInsensitiveSearch],
				  @"\"Lorem\" starts with \"lore\" (case insensitive)");
}

- (void)testStartsWithOptionsDifferentStringShouldBeFalseWithDefaultOptions {
	NSString *sut = @"Lorem";
	XCTAssertFalse([sut ml_startsWith:@"Ipsum" options:0], @"\"Lorem\" does not start with \"Ipsum\"");
}



#pragma mark -ml_startsWith: tests 
// Convenience method based on -ml_startsWith:comparisonOptions:

- (void)testStartsWithSameStringShouldBeTrue {
	NSString *sut = @"Lorem";
	XCTAssertTrue([sut ml_startsWith:sut], @"\"Lorem\" starts with \"Lorem\"");
}

- (void)testStartsWithMatchingPartialString {
	NSString *sut = @"Lorem";
	XCTAssertTrue([sut ml_startsWith:@"Lor"], @"\"Lorem\" starts with \"Lor\"");
}

- (void)testStartsWithIsCaseSensitive {
	NSString *sut = @"Lorem";
	XCTAssertFalse([sut ml_startsWith:@"lor"], @"\"Lorem\" starts with \"lor\" (case sensitive)");
}

- (void)testStartsWithDifferentStringShouldBeFalse {
	NSString *sut = @"Lorem";
	XCTAssertFalse([sut ml_startsWith:@"Ipsum"], @"\"Lorem\" does not start with \"Ipsum\"");
}



#pragma mark -ml_startsWithSearchString: tests
// Convenience method based on -ml_startsWith:comparisonOptions:

- (void)testStartsWithSearchIsCaseInsensitive {
	NSString *sut = @"Lorem";
	XCTAssertTrue([sut ml_startsWithSearch:@"lore"], @"\"Lorem\" starts with \"lore\" (case insensitive)");
}

- (void)testStartsWithSearchIsDiacriticInsensitive {
	NSString *sut = @"Lorem";
	XCTAssertTrue([sut ml_startsWithSearch:@"Löré"], @"\"Lorem\" starts with \"lore\" (diacritic insensitive)");
}

- (void)testStartsWithSearchEmptyStringShouldBeTrue {
	NSString *sut = @"Lorem";
	XCTAssertTrue([sut ml_startsWithSearch:@""], @"Filtering with an empty string should always be true");
}



@end
