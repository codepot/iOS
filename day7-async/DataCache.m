//
//  DataCache.m
//  day7-async
//
//  Created by Dave Henson on 8/5/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "DataCache.h"

@implementation DataCache

static DataCache *sharedData;

+(DataCache *)sharedData
{
    //GCD - Grand Central Dispatch
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if(!sharedData) sharedData = [[DataCache alloc] init];
        
    });
    
    return sharedData;
    
}


-(void)loadRexImageInBackground
{
    NSString *urlString = @"http://ucla201507.certifiednetworks.com/slowimage.php?sleeptime=2";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData __block *imgData;
    
    if(!localRex)
    {
        dispatch_queue_t myQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
        
        dispatch_async(myQueue, ^
        {
            
            imgData = [NSData dataWithContentsOfURL:url];
            
            dispatch_queue_t mainQueue = dispatch_get_main_queue();
            
            dispatch_async(mainQueue, ^{
                
                self.rexImage = [UIImage imageWithData:imgData];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"rexIsHere" object:nil];
            });
        });
        
    }
    
    UIImage *rex;
    
    
    if(imgData)
    {
       // UIImage *rex = [UIImage imageWithData:imgData];
        rex = [UIImage imageWithData:imgData];
        localRex = rex;
        //  iv.image = rex;
    }
    
  //  return rex;
    
}


@end
