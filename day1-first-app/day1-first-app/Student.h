//
//  Student.h
//  day1-first-app
//
//  Created by Dave Henson on 6/24/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    int age;
}

@property() NSString *email;


-(void)sendAnEmail:(NSString *)emailSubject
              body:(NSString *)emailBody
          priority:(int)emailPriority
              from:(NSString *)emailFrom
         recipient:(NSString *)emailTo;



+(Student *)createANewStudent;


@end
