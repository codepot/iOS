//
//  ArduinoClient.h
//  ArduinoClient
//
//  Created by Dave Henson on 12/12/12.
//  Copyright (c) 2012 Dave Henson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncUdpSocket.h"

@interface ArduinoClient : NSObject
{
    GCDAsyncUdpSocket *udpSocket;
    
    int port;
    NSString *host;
    int tag;
    int timeout;
}

-(void)sendMessage:(NSString *)msg;


@end
