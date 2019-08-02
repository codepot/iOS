//
//  AsyncString.m
//
//  Created by dhenson 

#import "AsyncString.h"


@implementation AsyncString


#pragma mark - Data Cache methods

-(void)downloadStringWithDelegate:(id)theDelegate
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
	delegate = theDelegate;
	
	NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:self.StringUrl]
                                                  cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60.0];
    
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
	// this method is called when the server has determined that it
    // has enough information to create the NSURLResponse
    // it can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    // receivedData is declared as a method instance elsewhere
    [myData setLength:0];
	
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // append the new data to the receivedData
    // receivedData is declared as a method instance elsewhere
    [myData appendData:data];
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
    // release the data object
    //[m_ImageRequestData release];
    
    // inform the user
   // NSLog(@"Connection failed! Error - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	workInProgress = NO;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
	if(workInProgress == YES)
	{
		workInProgress = NO;
		// Create the image with the downloaded data
		NSString* downloadedString = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding ];
        
		self.String = downloadedString;
        
		// release the data object
        //[downloadedString release];
		//[downloadedImage release];
		//[m_ImageRequestData release];
        
		
		// Verify that our delegate responds to the InternetImageReady method
		if ([delegate respondsToSelector:@selector(asyncStringReady:)])
		{
			// Call the delegate method and pass ourselves along.
			[delegate asyncStringReady:self];
		}
	}	
}


#pragma mark - Init and Memory Management
-(id) initWithUrl:(NSString*)urlToLoad
{
	self = [super init];
	
	if(self)
	{
		self.StringUrl = urlToLoad;
	}
	
	return self;
}



@end

