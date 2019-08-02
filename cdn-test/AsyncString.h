//
//  AsyncString.h
//

#import <Foundation/Foundation.h>


@interface AsyncString : NSObject 
{
    NSMutableData *myData;
  
    id delegate;
    NSURLConnection *myConnection;
    BOOL workInProgress;
}


@property (nonatomic, retain) NSString* StringUrl;
@property (nonatomic, retain) NSString* String;

@property (nonatomic, assign) int Identity;


-(id)initWithUrl:(NSString*)urlToLoad;

-(void)downloadStringWithDelegate:(id)delegate;

-(void)abortDownload;

@end


//add category to NSObject
@interface NSObject (InternetImageDelegate)
- (void)asyncStringReady:(AsyncString*)asyncString;
@end

