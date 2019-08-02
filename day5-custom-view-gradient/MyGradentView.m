//
//  MyGradentView.m
//  day5-custom-view-gradient
//
//  Created by Dave Henson on 7/22/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "MyGradentView.h"

@implementation MyGradentView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //setup timer
        [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
        
        
    }
    return self;
}

-(void)setupImage:(CGContextRef)context
{
    CGContextSaveGState(context);
    
    UIImage *image = [UIImage imageNamed:@"bottle.JPG"];
    
    CGContextTranslateCTM(context, 0, 300.0);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextDrawImage(context, CGRectMake(0.0, 0.0, 300.0, 300.0), image.CGImage);
    
    CGContextRestoreGState(context);
}



-(void)setupGradient
{
    if(gradientLayer != nil)
    {
        [gradientLayer removeFromSuperlayer];
    }
    
    gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor blackColor]CGColor],
                            (id)[[UIColor whiteColor]CGColor],
                            nil];
    //[self.layer insertSublayer:gradientLayer atIndex:0];
    [self.layer addSublayer:gradientLayer];
}

-(void)tick
{
    angle += .1;
    
    [self setNeedsDisplay];
}

- (void)drawStars:(NSUInteger)count inContext:(CGContextRef)context;
{
    // constants
    const float w = self.bounds.size.width;
    const float r = w/2;
    const double theta = 2 * M_PI * (2.0 / 5.0);
    const float flip = -1.0f; // flip vertically (default star representation)
    
    // drawing center for the star
    float xCenter = r;
    
    for (NSUInteger i=0; i<count; i++)
    {
        // get star style based on the index
        CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
        CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
        
        // update position
        CGContextMoveToPoint(context, xCenter, r * flip + r);
        
        // draw the necessary star lines
        for (NSUInteger k=1; k<5; k++)
        {
            float x = r * sin(k * theta);
            float y = r * cos(k * theta);
            CGContextAddLineToPoint(context, x + xCenter, y * flip + r);
        }
        
        // update horizontal center for the next star
        xCenter += w + self.bounds.origin.x;
        
        // draw current star
        CGContextClosePath(context);
        CGContextFillPath(context);
        CGContextStrokePath(context);
    }
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
   
    CGContextClearRect(context, CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height));
    
    [self setupImage:context];
    
    
   // [self setupGradient];
    
    
    [[UIColor blueColor] setStroke];
    
    CGContextSetLineWidth(context, 4.0);
   
    CGContextMoveToPoint(context, 10.0, 10.0);
    CGContextAddLineToPoint(context, 100.0, 100.0);
    CGContextStrokePath(context);
   
    CGContextRotateCTM(context, angle);
    
    CGContextMoveToPoint(context, 100.0, 100.0);
    CGContextAddLineToPoint(context, 20.0, 290.0);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 10.0, 10.0);
    CGContextAddQuadCurveToPoint(context, 30.0, 40.0, 300.0, 300.0);
    
    CGContextStrokePath(context);
    
    [self drawStars:5 inContext:context];
    
    
}

@end
