//
//  NSDate+MLFrameworkLite.m
//  MLFrameworkLite
//
//  Created by Miguel Lara on 23/03/14.
//  Copyright (c) 2014 Miguel Lara. All rights reserved.
//

#import "NSDate+MLFrameworkLite.h"

#define MLMatchComponentsTest(mask, current, reference, component, method) \
	((mask & component) != component || [current method] == [reference method])

@implementation NSDate (MLFrameworkLite)

- (BOOL)ml_isToday
{
	return [self ml_isSameDayAsDate:[NSDate date]];
}

- (BOOL)ml_isSameDayAsDate:(NSDate *)reference
{
	return [self ml_date:reference
			  onCalendar:[NSCalendar currentCalendar]
	   matchesComponents:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit)];
}

- (BOOL)ml_isThisWeek
{
	return [self ml_isSameWeekAsDate:[NSDate date]];
}

- (BOOL)ml_isSameWeekAsDate:(NSDate *)reference
{
	return [self ml_date:reference
			  onCalendar:[NSCalendar currentCalendar]
	   matchesComponents:(NSEraCalendarUnit|NSYearCalendarUnit|NSWeekOfYearCalendarUnit)];
}

- (BOOL)ml_isThisMonth
{
	return [self ml_isSameMonthAsDate:[NSDate date]];
}

- (BOOL)ml_isSameMonthAsDate:(NSDate *)reference
{
	return [self ml_date:reference
			  onCalendar:[NSCalendar currentCalendar]
	   matchesComponents:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit)];
}

- (BOOL)ml_isThisYear
{
	return [self ml_isSameYearAsDate:[NSDate date]];
}

- (BOOL)ml_isSameYearAsDate:(NSDate *)reference
{
	return [self ml_date:reference
			  onCalendar:[NSCalendar currentCalendar]
	   matchesComponents:(NSEraCalendarUnit|NSYearCalendarUnit)];
}

/*!
 @param components A bitwise \c OR of \c NSCalendarUnit constants.
 */
- (BOOL)ml_date:(NSDate *)referenceDate onCalendar:(NSCalendar *)calendar matchesComponents:(NSCalendarUnit)components
{
	NSDateComponents *current = [calendar components:components fromDate:self];
	NSDateComponents *reference = [calendar components:components fromDate:referenceDate];
	
	return (MLMatchComponentsTest(components, current, reference, NSCalendarUnitEra, era)
			&& MLMatchComponentsTest(components, current, reference, NSCalendarUnitYear, year)
			&& MLMatchComponentsTest(components, current, reference, NSCalendarUnitMonth, month)
			&& MLMatchComponentsTest(components, current, reference, NSCalendarUnitDay, day)
			&& MLMatchComponentsTest(components, current, reference, NSCalendarUnitHour, hour)
			&& MLMatchComponentsTest(components, current, reference, NSCalendarUnitMinute, minute)
			&& MLMatchComponentsTest(components, current, reference, NSCalendarUnitSecond, second)
			&& MLMatchComponentsTest(components, current, reference, NSCalendarUnitWeekday, weekdayOrdinal)
			&& MLMatchComponentsTest(components, current, reference, NSCalendarUnitWeekdayOrdinal, weekdayOrdinal)
			&& MLMatchComponentsTest(components, current, reference, NSCalendarUnitWeekOfMonth, weekOfMonth)
			&& MLMatchComponentsTest(components, current, reference, NSCalendarUnitWeekOfYear, weekOfYear));
}

@end
