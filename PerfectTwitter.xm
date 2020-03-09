#import "PerfectTwitter.h"

// -------------------------------- ALWAYS LATEST TIMELINE --------------------------------

%hook T1HomeTimelineVariantCoordinator

- (_Bool)isLatestSwitchEnabled
{
	return YES;
}

- (_Bool)_tfn_switchToTopTimePastThreshold:(double)arg1
{
	return NO;
}

- (_Bool)shouldResetToTopTimeline
{
	return NO;
}

- (void)setLatestHomeTimelineActive:(_Bool)arg1
{
	%orig(true);
}

- (_Bool)isLatestHomeTimelineActive
{
	return YES;
}

%end

// -------------------------------- HIDE PROMO POSTS --------------------------------

// Code taken from @kemmis "twitter-no-ads" project

%hook TFNItemsDataViewController

- (id)tableViewCellForItem: (id)v1 atIndexPath: (id)v2
{
	UITableViewCell *tvCell = %orig;

	id item = [[self itemsInternalDataViewItemAtValidIndexPath: v2] item];
	if([item respondsToSelector: @selector(isPromoted)] && [item performSelector: @selector(isPromoted)]) [tvCell setHidden: YES];
	return tvCell;	
}

- (double)tableView: (id)arg1 heightForRowAtIndexPath: (id)arg2
{
	id item = [self itemAtIndexPath: arg2];
	if([item respondsToSelector: @selector(isPromoted)] && [item performSelector: @selector(isPromoted)]) return 0;
	return %orig;
}

%end
