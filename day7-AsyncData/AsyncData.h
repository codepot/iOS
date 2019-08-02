//
//  AsyncData.h
//  day7-AsyncData
//
//  Created by Dave Henson on 8/5/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AsyncData : NSObject

@property (assign) NSInteger tag;

@property(nonatomic, copy) void (^completionDataHandler)(NSData *internetData);

-(void)startDownload:(NSString *)urlString;
-(void)stopDownload;


@end
