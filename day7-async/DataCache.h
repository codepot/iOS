//
//  DataCache.h
//  day7-async
//
//  Created by Dave Henson on 8/5/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DataCache : NSObject
{
    UIImage *localRex;
}

//+(DataCache) *sharedData();

+(DataCache *)sharedData;

-(void)loadRexImageInBackground;

@property(nonatomic, strong) UIImage *rexImage;

@end
