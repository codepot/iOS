//
//  AsyncString.h
//
//  Created by dhenson on 8/22/11.

#import <Foundation/Foundation.h>
#import "AsyncImage.h"

@interface AsyncImage : NSObject
{
    
    NSMutableData *myData;
  
    id delegate;
    NSURLConnection *myConnection;
    
	bool workInProgress;
    int identity;
}


@property (nonatomic, retain) NSString* ImageUrl;
@property (nonatomic, retain) UIImage* Image;

@property (nonatomic, assign) int Identity;
@property (nonatomic, assign) NSString *shortDescription;

@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *firstResponseDate;

@property (strong, nonatomic) NSDate *firstByteDate;
@property (strong, nonatomic) NSDate *completedDate;

@property (assign) float millisecondsToComplete;
@property (assign) float millisecondsToFirstByte;


-(id)initWithUrl:(NSString*)urlToLoad;

-(void)downloadStringWithDelegate:(id)delegate;

-(void)abortDownload;

@end


//add category to NSObject
@interface NSObject (InternetImageDelegate)
- (void)asyncImageReady:(AsyncImage*)asyncImage;
@end

