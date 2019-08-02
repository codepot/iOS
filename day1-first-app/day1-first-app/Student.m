//
//  Student.m
//  day1-first-app
//
//  Created by Dave Henson on 6/24/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "Student.h"

@implementation Student

-(void)sendAnEmail:(NSString *)emailSubject
              body:(NSString *)emailBody
          priority:(int)emailPriority
              from:(NSString *)emailFrom
         recipient:(NSString *)emailTo
{
    //send an email here....
}


+(Student *)createANewStudent
{
    Student *s = [[Student alloc] init];
    return s;
}

@end
