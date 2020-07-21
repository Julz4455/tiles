#line 1 "Tweak.xm"

#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class NCToggleControl; @class NCNotificationListSectionRevealHintView; @class NCNotificationListHeaderTitleView; @class NCNotificationShortLookView; 
static void (*_logos_orig$_ungrouped$NCNotificationListHeaderTitleView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL NCNotificationListHeaderTitleView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$NCNotificationListHeaderTitleView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCNotificationListHeaderTitleView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$NCToggleControl$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL NCToggleControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$NCToggleControl$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCToggleControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$NCNotificationShortLookView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL NCNotificationShortLookView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$NCNotificationShortLookView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCNotificationShortLookView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$NCNotificationListSectionRevealHintView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$NCNotificationListSectionRevealHintView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST, SEL); 

#line 1 "Tweak.xm"
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
bool clearEnabled = true;
bool timerDone = true;
bool noIcons = true;
bool didBlockAlready = false;
bool didAllowFirstException = false;
NCNotificationShortLookView *lastBlock;

static void _logos_method$_ungrouped$NCNotificationListHeaderTitleView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCNotificationListHeaderTitleView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$NCNotificationListHeaderTitleView$layoutSubviews(self, _cmd);
	[self removeFromSuperview];
}


static void _logos_method$_ungrouped$NCToggleControl$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCToggleControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if(clearEnabled) {
		_logos_orig$_ungrouped$NCToggleControl$layoutSubviews(self, _cmd);
		return;
	} else if(!clearEnabled && [self.title isEqualToString:@"Clear"]) {
		_logos_orig$_ungrouped$NCToggleControl$layoutSubviews(self, _cmd);
		[self removeFromSuperview];
	}
}


static void _logos_method$_ungrouped$NCNotificationShortLookView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCNotificationShortLookView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$NCNotificationShortLookView$layoutSubviews(self, _cmd);
	if(timerDone) {
		timerDone = false;
		[NSTimer
		scheduledTimerWithTimeInterval:1.0
		repeats:NO
		block:^void(NSTimer *timer) {
			timerDone = true;
			if(lastBlock != self) {
				[self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y+87*2, 177.5, 174)];
				lastBlock = self;
			} else {
				return;
			}
		}];
	}
	if(noIcons) {
		self.icons = nil;
		[self _setGrabberVisible:YES];
	}
}



static void _logos_method$_ungrouped$NCNotificationListSectionRevealHintView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL NCNotificationListSectionRevealHintView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$NCNotificationListSectionRevealHintView$layoutSubviews(self, _cmd);
	[self removeFromSuperview];
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$NCNotificationListHeaderTitleView = objc_getClass("NCNotificationListHeaderTitleView"); MSHookMessageEx(_logos_class$_ungrouped$NCNotificationListHeaderTitleView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$NCNotificationListHeaderTitleView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$NCNotificationListHeaderTitleView$layoutSubviews);Class _logos_class$_ungrouped$NCToggleControl = objc_getClass("NCToggleControl"); MSHookMessageEx(_logos_class$_ungrouped$NCToggleControl, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$NCToggleControl$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$NCToggleControl$layoutSubviews);Class _logos_class$_ungrouped$NCNotificationShortLookView = objc_getClass("NCNotificationShortLookView"); MSHookMessageEx(_logos_class$_ungrouped$NCNotificationShortLookView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$NCNotificationShortLookView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$NCNotificationShortLookView$layoutSubviews);Class _logos_class$_ungrouped$NCNotificationListSectionRevealHintView = objc_getClass("NCNotificationListSectionRevealHintView"); MSHookMessageEx(_logos_class$_ungrouped$NCNotificationListSectionRevealHintView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$NCNotificationListSectionRevealHintView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$NCNotificationListSectionRevealHintView$layoutSubviews);} }
#line 71 "Tweak.xm"
