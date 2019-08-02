//
//  AsyncData.m
//  day7-AsyncData
//
//  Created by Dave Henson on 8/5/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "AsyncData.h"

@implementation AsyncData


-(void)startDownload:(NSString *)urlString;
{
    NSURL *url = [NSURL URLWithString:urlString];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
    
        dispatch_async(dispatch_get_main_queue(), ^{
            [self processCompletionHandler:data];

        });
        
});
    
}

-(void)processCompletionHandler:(NSData *)downloadedData
{
    if(self.completionDataHandler)
    {
        self.completionDataHandler(downloadedData);
    }
}

-(void)stopDownload;
{
    
}

@end
