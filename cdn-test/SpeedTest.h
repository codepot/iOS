//
//  SpeedTest.h
//  cdn-test
//
//  Created by Dave Henson on 5/19/14.

#import <Foundation/Foundation.h>
#import "AsyncImage.h"

@interface SpeedTest : NSObject

@property(strong, nonatomic) NSString *shortDescription;
@property(strong, nonatomic) NSURL *url;
@property(strong, nonatomic) NSDate *testDate;
@property (nonatomic, retain) AsyncImage *asyncImage;

@property(assign) float firstByteMS;
@property(assign) float lastByteMS;


@end
