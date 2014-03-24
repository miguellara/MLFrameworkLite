//
//  NSDate+MLFrameworkLite.h
//  MLFrameworkLite
//
//  Created by Miguel Lara on 23/03/14.
//  Copyright (c) 2014 Miguel Lara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MLFrameworkLite)

- (BOOL)ml_isToday;
- (BOOL)ml_isSameDayAsDate:(NSDate *)reference;

- (BOOL)ml_isThisWeek;
- (BOOL)ml_isSameWeekAsDate:(NSDate *)reference;

- (BOOL)ml_isThisMonth;
- (BOOL)ml_isSameMonthAsDate:(NSDate *)reference;

- (BOOL)ml_isThisYear;
- (BOOL)ml_isSameYearAsDate:(NSDate *)reference;

/*!
 @param components A bitwise \c OR of \c NSCalendarUnit constants.
 */
- (BOOL)ml_date:(NSDate *)referenceDate onCalendar:(NSCalendar *)calendar matchesComponents:(NSCalendarUnit)components;

@end
