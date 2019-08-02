
#import <Foundation/Foundation.h>
/*!
 
 Student class to demonstrate documentation
 
 
 
*/
@interface Student : NSObject
{
    //ivars
}

/*!
 sendAnEmail method
 
 @description Sends an email to a student
 @param subject
 @param body
 
 @see http://www.disney.com
 
 @author Dave Henson
 
 @warning Do not use this method while drinking
 
 
 */
-(void)sendAnEmail;

/*!
 @description This is a dummy property
 */
@property()NSString *stuff;

@end
