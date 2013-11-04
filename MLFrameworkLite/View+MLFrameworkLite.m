//
//  View+MLFrameworkLite.m
//  MLFrameworkLite
//
//  Created by Miguel Lara on 04/11/13.
//  Copyright (c) 2013 Miguel Lara. All rights reserved.
//

#import "View+MLFrameworkLite.h"


@implementation ML_PLATFORM_VIEW (MLFrameworkLite)

- (CGPoint)ml_frameOrigin
{
	return self.frame.origin;
}

- (void)ml_setFrameOrigin:(CGPoint)value
{
	CGRect frame = self.frame;
	frame.origin = value;
	self.frame = frame;
}

- (CGFloat)ml_frameX
{
	return self.frame.origin.x;
}

- (void)ml_setFrameX:(CGFloat)value
{
	CGRect frame = self.frame;
	frame.origin.x = value;
	self.frame = frame;
}

- (CGFloat)ml_frameY
{
	return self.frame.origin.y;
}

- (void)ml_setFrameY:(CGFloat)value
{
	CGRect frame = self.frame;
	frame.origin.y = value;
	self.frame = frame;
}

- (CGSize)ml_frameSize {
	return self.frame.size;
}

- (void)ml_setFrameSize:(CGSize)value
{
	CGRect frame = self.frame;
	frame.size = value;
	self.frame = frame;
}

- (CGFloat)ml_frameWidth {
	return self.frame.size.width;
}

- (void)ml_setFrameWidth:(CGFloat)value
{
	CGRect frame = self.frame;
	frame.size.width = value;
	self.frame = frame;
}

- (CGFloat)ml_frameHeight
{
	return self.frame.size.height;
}

- (void)ml_setFrameHeight:(CGFloat)value
{
	CGRect frame = self.frame;
	frame.size.height = value;
	self.frame = frame;
}


- (CGPoint)ml_boundsOrigin
{
	return self.bounds.origin;
}

- (void)ml_setBoundsOrigin:(CGPoint)value
{
	CGRect bounds = self.bounds;
	bounds.origin = value;
	self.bounds = bounds;
}

- (CGFloat)ml_boundsX
{
	return self.bounds.origin.x;
}

- (void)ml_setBoundsX:(CGFloat)value
{
	CGRect bounds = self.bounds;
	bounds.origin.x = value;
	self.bounds = bounds;
}

- (CGFloat)ml_boundsY
{
	return self.bounds.origin.y;
}

- (void)ml_setBoundsY:(CGFloat)value
{
	CGRect bounds = self.bounds;
	bounds.origin.y = value;
	self.bounds = bounds;
}

- (CGSize)ml_boundsSize
{
	return self.bounds.size;
}

- (void)ml_setBoundsSize:(CGSize)value
{
	CGRect bounds = self.bounds;
	bounds.size = value;
	self.bounds = bounds;
}

- (CGFloat)ml_boundsWidth
{
	return self.bounds.size.width;
}

- (void)ml_setBoundsWidth:(CGFloat)value
{
	CGRect bounds = self.bounds;
	bounds.size.width = value;
	self.bounds = bounds;
}

- (CGFloat)ml_boundsHeight
{
	return self.bounds.size.height;
}

- (void)ml_setBoundsHeight:(CGFloat)value
{
	CGRect bounds = self.bounds;
	bounds.size.height = value;
	self.bounds = bounds;
}


// Don't have time right now, but good to use eventually.
//
//#pragma mark Animations
//
//static CFTimeInterval const kMLShakeSubAnimationDuration = 0.05;
//static float const kMLShakeSubAnimationRepetitions = 4.f;
//static CGPoint const kMLShakeAnimationOffset = {.x = 8.f, .y = 0.f};
//
//- (CABasicAnimation *)ml_animateShake
//{
//	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
//	[animation setDuration:kMLShakeSubAnimationDuration];
//	[animation setRepeatCount:kMLShakeSubAnimationRepetitions];
//	[animation setAutoreverses:YES];
//	CGPoint center = CGPointMake(self.ml_frameX + self.ml_frameWidth / 2.f,
//								 self.ml_frameY + self.ml_frameHeight / 2.f)
//	[animation setFromValue:[NSValue valueWithCGPoint:CGPointMake(center.x - kMLShakeAnimationOffset.x,
//																  center.y - kMLShakeAnimationOffset.y)]];
//	[animation setToValue:[NSValue valueWithCGPoint:CGPointMake(center.x + kMLShakeAnimationOffset.x,
//																center.y + kMLShakeAnimationOffset.y)]];
//	[self.layer addAnimation:animation forKey:@"position"];
//	return animation;
//}

@end
