//
//  MyView.m
//  day5-custom-views
//
//  Created by Dave Henson on 7/22/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

#import "MyView.h"

@implementation MyView

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.endPoint = [[touches anyObject] locationInView:self];
   
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    NSLog(@"drawRect");
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, 10.0, 10.0);
    CGContextAddLineToPoint(context, self.endPoint.x, self.endPoint.y);
    
    [[UIColor redColor] setStroke];
    
    CGContextStrokePath(context);
}


@end
