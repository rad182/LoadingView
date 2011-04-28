//
//  LoadingView.h
//  rad182
//
//  Created by Royce Albert Dy on 4/27/11.
//  Copyright 2011 rad182. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoadingView : UIView {
    UIActivityIndicatorView *spinner;
    UILabel *loadingLabel;
    UIView *container;
}

@property (nonatomic, retain) UILabel *loadingLabel;

+ (LoadingView *)showLoadingViewAddedTo:(UIView *)view;
+ (void)hideLoadingViewForView:(UIView *)view;

@end
