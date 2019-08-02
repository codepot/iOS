//
//  MyGradentView.h
//  day5-custom-view-gradient
//
//  Created by Dave Henson on 7/22/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MyGradentView : UIView
{
    CAGradientLayer *gradientLayer;
    CGFloat angle;
    
}
@end
