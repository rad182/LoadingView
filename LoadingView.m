//
//  LoadingView.m
//  rad182
//
//  Created by Royce Albert Dy on 4/27/11.
//  Copyright 2011 rad182. All rights reserved.
//

#import "LoadingView.h"


@implementation LoadingView

@synthesize loadingLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor lightGrayColor];
        [self setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
        
        container = [[UIView alloc] init];
        [container setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin];
        
        spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [spinner startAnimating];
        [container addSubview:spinner];
        
        loadingLabel = [[UILabel alloc] init];
        [loadingLabel setFont:[UIFont boldSystemFontOfSize:12.0f]];
        [loadingLabel setBackgroundColor:[UIColor clearColor]];
        [loadingLabel setTextColor:[UIColor viewFlipsideBackgroundColor]];
        [loadingLabel setShadowColor:[UIColor whiteColor]];
        [loadingLabel setShadowOffset:CGSizeMake(0, 1)];
        [loadingLabel setText:@"Loading..."];
        [container addSubview:loadingLabel];
        
        [self addSubview:container];
        
    }
    return self;
}

- (void)layoutSubviews {
    CGSize viewsize = self.frame.size;
    CGSize spinnersize = [spinner bounds].size;
    CGSize textsize = [[loadingLabel text] sizeWithFont:[loadingLabel font]];
    float bothwidth = spinnersize.width + textsize.width + 5.0f;
    
    CGRect containrect = {
        CGPointMake(floorf((viewsize.width / 2) - (bothwidth / 2)), floorf((viewsize.height / 2) - (spinnersize.height / 2))),
        CGSizeMake(bothwidth, spinnersize.height)
    };
    CGRect textrect = {
        CGPointMake(spinnersize.width + 5.0f, floorf((spinnersize.height / 2) - (textsize.height / 2))),
        textsize
    };
    CGRect spinrect = {
        CGPointZero,
        spinnersize
    };
    
    [container setFrame:containrect];
    [spinner setFrame:spinrect];
    [loadingLabel setFrame:textrect];
}

#pragma mark -
#pragma mark Class methods

+ (LoadingView *)showLoadingViewAddedTo:(UIView *)view {
	LoadingView *loadingView = [[LoadingView alloc] initWithFrame:view.bounds];
	[view addSubview:loadingView];
	return [loadingView autorelease];
}

+ (void)hideLoadingViewForView:(UIView *)view {
	for (UIView *v in [view subviews]) {
		if ([v isKindOfClass:[LoadingView class]]) {
            [v removeFromSuperview];
            break;
		}
	}
}

#pragma mark -

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [loadingLabel release];
    [spinner release];
    [container release];
    [super dealloc];
}

@end
