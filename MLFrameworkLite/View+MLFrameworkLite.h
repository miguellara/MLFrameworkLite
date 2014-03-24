//
//  View+MLFrameworkLite.h
//  MLFrameworkLite
//
//  Created by Miguel Lara on 04/11/13.
//  Copyright (c) 2013 Miguel Lara. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
	#import <UIKit/UIKit.h>
	#define ML_PLATFORM_VIEW UIView
#else
	#import <AppKit/AppKit.h>
	#define ML_PLATFORM_VIEW NSView
#endif


@interface ML_PLATFORM_VIEW (MLFrameworkLite)

@property (assign, nonatomic, getter = ml_frameOrigin, setter = ml_setFrameOrigin:) CGPoint ml_frameOrigin;
@property (assign, nonatomic, getter = ml_frameX, setter = ml_setFrameX:) CGFloat ml_frameX;
@property (assign, nonatomic, getter = ml_frameY, setter = ml_setFrameY:) CGFloat ml_frameY;
@property (assign, nonatomic, getter = ml_frameSize, setter = ml_setFrameSize:) CGSize ml_frameSize;
@property (assign, nonatomic, getter = ml_frameWidth, setter = ml_setFrameWidth:) CGFloat ml_frameWidth;
@property (assign, nonatomic, getter = ml_frameHeight, setter = ml_setFrameHeight:) CGFloat ml_frameHeight;

@property (assign, nonatomic, getter = ml_boundsOrigin, setter = ml_setBoundsOrigin:) CGPoint ml_boundsOrigin;
@property (assign, nonatomic, getter = ml_boundsX, setter = ml_setBoundsX:) CGFloat ml_boundsX;
@property (assign, nonatomic, getter = ml_boundsY, setter = ml_setBoundsY:) CGFloat ml_boundsY;
@property (assign, nonatomic, getter = ml_boundsSize, setter = ml_setBoundsSize:) CGSize ml_boundsSize;
@property (assign, nonatomic, getter = ml_boundsWidth, setter = ml_setBoundsWidth:) CGFloat ml_boundsWidth;
@property (assign, nonatomic, getter = ml_boundsHeight, setter = ml_setBoundsHeight:) CGFloat ml_boundsHeight;

//- (CABasicAnimation *)ml_animateShake;

@end
