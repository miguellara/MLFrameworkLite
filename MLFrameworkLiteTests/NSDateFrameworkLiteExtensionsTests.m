//
//  NSDateFrameworkLiteExtensionsTests.m
//  MLFrameworkLite
//
//  Created by Miguel Lara on 23/03/14.
//  Copyright (c) 2014 Miguel Lara. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSDate+MLFrameworkLite.h"


@interface NSDateFrameworkLiteExtensionsTests : XCTestCase
{
	NSDate *sut;
}

@end


@implementation NSDateFrameworkLiteExtensionsTests

- (void)setUp
{
    [super setUp];
	
	sut = [self dateWithYear:1983 month:7 day:19 hour:12 minutes:00 seconds:00];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDateIsSameDayAsItself
{
    XCTAssertTrue([sut ml_isSameDayAsDate:sut]);
}

- (void)testDateIsSameDayAsBeginingOfDay
{
	NSDate *ref = [self dateWithYear:1983 month:7 day:19 hour:00 minutes:00 seconds:00];
	XCTAssertTrue([sut ml_isSameDayAsDate:ref]);
}

- (void)testDateIsSameDayAsEndOfDay
{
	NSDate *ref = [self dateWithYear:1983 month:7 day:19 hour:23 minutes:59 seconds:59];
	XCTAssertTrue([sut ml_isSameDayAsDate:ref]);
}

- (void)testDateIsNotSameDayAsTheDayBefore
{
	NSDate *ref = [self dateWithYear:1983 month:7 day:18 hour:00 minutes:00 seconds:00];
	XCTAssertFalse([sut ml_isSameDayAsDate:ref]);
}

- (void)testDateIsNotSameDayAsTheDayAfter
{
	NSDate *ref = [self dateWithYear:1983 month:7 day:20 hour:00 minutes:00 seconds:00];
	XCTAssertFalse([sut ml_isSameDayAsDate:ref]);
}

- (void)testDateIsSameWeekAsItself
{
    XCTAssertTrue([sut ml_isSameWeekAsDate:sut]);
}

- (void)testDateIsSameWeekAsPreviousMonday
{
	NSDate *ref = [self dateWithYear:1983 month:7 day:18 hour:12 minutes:00 seconds:00];
	XCTAssertTrue([sut ml_isSameWeekAsDate:ref]);
}

- (void)testDateIsSameDayAsNextSaturday
{
	NSDate *ref = [self dateWithYear:1983 month:7 day:23 hour:12 minutes:00 seconds:00];
	XCTAssertTrue([sut ml_isSameWeekAsDate:ref]);
}

- (void)testDateIsNotSameWeekAsTheWeekBefore
{
	NSDate *ref = [self dateWithYear:1983 month:7 day:13 hour:12 minutes:00 seconds:00];
	XCTAssertFalse([sut ml_isSameWeekAsDate:ref]);
}

- (void)testDateIsNotSameWeekAsTheWeekAfter
{
	NSDate *ref = [self dateWithYear:1983 month:7 day:26 hour:12 minutes:00 seconds:00];
	XCTAssertFalse([sut ml_isSameWeekAsDate:ref]);
}

- (void)testDateIsSameMonthAsItself
{
    XCTAssertTrue([sut ml_isSameMonthAsDate:sut]);
}

- (void)testDateIsSameMonthAsFistDayOfMonth
{
	NSDate *ref = [self dateWithYear:1983 month:7 day:1 hour:12 minutes:00 seconds:00];
	XCTAssertTrue([sut ml_isSameMonthAsDate:ref]);
}

- (void)testDateIsSameMonthAsLastDayOfMonth
{
	NSDate *ref = [self dateWithYear:1983 month:7 day:31 hour:12 minutes:00 seconds:00];
	XCTAssertTrue([sut ml_isSameMonthAsDate:ref]);
}

- (void)testDateIsNotSameMonthAsTheLastDayOfTheMonthBefore
{
	NSDate *ref = [self dateWithYear:1983 month:6 day:30 hour:12 minutes:00 seconds:00];
	XCTAssertFalse([sut ml_isSameMonthAsDate:ref]);
}

- (void)testDateIsNotSameMonthAsTheFirstDayOfTheMonthAfter
{
	NSDate *ref = [self dateWithYear:1983 month:8 day:1 hour:12 minutes:00 seconds:00];
	XCTAssertFalse([sut ml_isSameMonthAsDate:ref]);
}

- (void)testDateIsSameYearAsItself
{
    XCTAssertTrue([sut ml_isSameYearAsDate:sut]);
}

- (void)testDateIsSameYearAsFistDayOfYear
{
	NSDate *ref = [self dateWithYear:1983 month:1 day:1 hour:12 minutes:00 seconds:00];
	XCTAssertTrue([sut ml_isSameYearAsDate:ref]);
}

- (void)testDateIsSameYearAsLastDayOfYear
{
	NSDate *ref = [self dateWithYear:1983 month:12 day:30 hour:12 minutes:00 seconds:00];
	XCTAssertTrue([sut ml_isSameYearAsDate:ref]);
}

- (void)testDateIsNotSameYearAsTheLastDayOfTheYearBefore
{
	NSDate *ref = [self dateWithYear:1982 month:12 day:30 hour:12 minutes:00 seconds:00];
	XCTAssertFalse([sut ml_isSameYearAsDate:ref]);
}

- (void)testDateIsNotSameYearAsTheFirstDayOfTheYearAfter
{
	NSDate *ref = [self dateWithYear:1984 month:1 day:1 hour:12 minutes:00 seconds:00];
	XCTAssertFalse([sut ml_isSameYearAsDate:ref]);
}

- (NSDate *)dateWithYear:(NSInteger)year
				   month:(NSInteger)month
					 day:(NSInteger)day
					hour:(NSInteger)hour
				 minutes:(NSInteger)minutes
				 seconds:(NSInteger)seconds
{
	NSDateComponents *components = [[NSDateComponents alloc] init];
	components.year = year;
	components.month = month;
	components.day = day;
	components.hour = hour;
	components.minute = minutes;
	components.second = seconds;
	return [[NSCalendar currentCalendar] dateFromComponents:components];
}

@end
