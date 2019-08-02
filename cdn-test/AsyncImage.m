//
//  AsyncString.m
//
//  Created by dhenson 

#import "AsyncImage.h"

@implementation AsyncImage



#pragma mark - Data Cache methods

-(void)downloadStringWithDelegate:(id)theDelegate
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
	delegate = theDelegate;
	
	NSURLRequest *req = [NSURLRequest requestWithURL:
                         [NSURL URLWithString:self.ImageUrl]
            cachePolicy:NSURLRequestReloadIgnoringCacheData
                            timeoutInterval:60.0];
    self.startDate = [NSDate date];
	myConnection = [[NSURLConnection alloc] initWithRequest:req delegate:self];
	
	if(myConnection)
	{
		workInProgress = YES;
        
		myData = [NSMutableData data];
	}
}




-(void)abortDownload
{
	if(workInProgress == YES)
	{
		[myConnection cancel];
		workInProgress = NO;
	}
}


#pragma mark -  NSConnection Delegate Callbacks
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.firstResponseDate = [NSDate date];
    
    
	// this method is called when the server has determined that it
    // has enough information to create the NSURLResponse
    // it can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    [myData setLength:0];
	
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    self.firstByteDate = [NSDate date];
    self.millisecondsToFirstByte = [self.firstByteDate timeIntervalSinceDate:self.startDate ];
    // append the new data to the receivedData
    // receivedData is declared as a method instance elsewhere
    [myData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
    // release the data object
    //[m_ImageRequestData release];
    
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
	workInProgress = NO;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    self.completedDate = [NSDate date];
    
    
   // NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:(NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:[NSDate date]];
   // NSInteger seconds = [dateComponents second];
   // NSInteger minutes = [dateComponents minute];
   // NSInteger hours = [dateComponents hour];
    
    self.millisecondsToComplete = [self.completedDate timeIntervalSinceDate:self.startDate];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
	if(workInProgress == YES)
	{
		workInProgress = NO;
	
       // NSString* downloadedString = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding ];
        UIImage *downloadedImage = [UIImage imageWithData: myData];
        
		self.Image = downloadedImage;
        
		
		// Verify that our delegate responds to the InternetImageReady method
		if ([delegate respondsToSelector:@selector(asyncImageReady:)])
		{
			// Call the delegate method and pass ourselves along.
			[delegate asyncImageReady:self];
		}
	}	
}


#pragma mark - Init and Memory Management
-(id) initWithUrl:(NSString*)urlToLoad
{
	self = [super init];
	
	if(self)
	{
		self.ImageUrl = urlToLoad;
	}
	
	return self;
}



@end

