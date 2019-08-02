//
//  ArduinoClient.m
//  ArduinoClient
//
//  Created by Dave Henson on 12/12/12.
//  Copyright (c) 2012 Dave Henson. All rights reserved.
//

#import "ArduinoClient.h"

@implementation ArduinoClient

- (id)init
{
    self = [super init];
    if (self) {
        [self setupSocket];
        
        //host = @"172.17.216.196";
        host = @"10.240.0.19";
        port = 8888;
        tag = 1;
        timeout = -1;
    }
    return self;
}

- (void)setupSocket
{
	
	udpSocket = [[GCDAsyncUdpSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
	
	NSError *error = nil;
	
	if (![udpSocket bindToPort:0 error:&error])
	{
		return;
	}
	if (![udpSocket beginReceiving:&error])
	{
		return;
	}
	
	
}


-(void)sendMessage:(NSString *)msg
{
    NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding];
	[udpSocket sendData:data toHost:host port:port withTimeout:timeout tag:tag];
	
}

@end
