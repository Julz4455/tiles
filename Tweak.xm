#import <UIKit/UIKit.h>
@interface NCNotificationListHeaderTitleView : UIView
@end
@interface PLGlyphControl : UIControl
@end
@interface NCToggleControl : PLGlyphControl
@property (nonatomic,copy) NSString * title; 
@end
@interface NCNotificationShortLookView : UIView {
	BOOL _grabberVisible;
}
@property (nonatomic,copy) NSArray * icons;
-(void)_setGrabberVisible:(BOOL)arg1;
@end
@interface NCNotificationListSectionRevealHintView : UIView
@end
static bool clearEnabled = true;
static bool timerDone = true;
static bool noIcons = true;
static bool didBlockAlready = false;
static bool didAllowFirstException = false;
NCNotificationShortLookView *lastBlock;
%hook NCNotificationListHeaderTitleView
-(void)layoutSubviews {
	%orig;
	[self removeFromSuperview];
}
%end
%hook NCToggleControl
-(void)layoutSubviews {
	if(clearEnabled) {
		%orig;
		return;
	} else if(!clearEnabled && [self.title isEqualToString:@"Clear"]) {
		%orig;
		[self removeFromSuperview];
	}
}
%end
%hook NCNotificationShortLookView
-(void)layoutSubviews {
	%orig;
	if(timerDone) {
		timerDone = false;
		[NSTimer
		scheduledTimerWithTimeInterval:1.0
		repeats:NO
		block:^void(NSTimer *timer) {
			timerDone = true;
			if(didAllowFirstException) {
				if(lastBlock != self) {
					[self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y+87, 177.5, 174)];
					lastBlock = self;
				} else {
					return;
				}
			} else {
				didAllowFirstException = true;
				[self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y+87*2, 177.5, 174)];
				lastBlock = self;
			}
		}];
	}
	if(noIcons) {
		self.icons = nil;
		[self _setGrabberVisible:YES];
	}
}
%end

%hook NCNotificationListSectionRevealHintView
-(void)layoutSubviews {
	%orig;
	[self removeFromSuperview];
}
%end
