

//  Homework5
//  Created by Phuc Le on 7/26/15.

#import "BarGraphView.h"

@interface BarGraphView ()
@property () NSArray *array;

@end

@implementation BarGraphView

+ (Class)layerClass {
    return [CAShapeLayer class];
}

- (void)drawRect:(CGRect)rect {
    
    self.array = @[@150, @240, @300, @350, @305, @245, @285, @270, @200, @140];
    
    CGColorRef greenColor = [[UIColor greenColor] CGColor];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    CGContextSetFillColorWithColor(context, greenColor);
    
    CGContextSetTextMatrix(context, CGAffineTransformMake(1.0,0.0, 0.0, -1.0, 0.0, 0.0));
    
    
    NSString *text = @"";
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    float x = 50.0;
    float x_label = 38.0;
    float y_label = 280.0;
    
    for(NSNumber *number in self.array)
    {
        y_label = 500.0 - [number intValue] - 20.0;
        [path moveToPoint:CGPointMake(x,500.0)];
        [path addLineToPoint:CGPointMake(x, 500.0  - [number intValue])];
        text = [NSString stringWithFormat:@"%d", [number intValue]];
        [text drawAtPoint:CGPointMake(x_label, y_label) withAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:12.0], NSForegroundColorAttributeName: [UIColor whiteColor]}];
        x += 40;
        x_label += 40.0;
        
    }
    NSLog(@"%f",x);
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = [[UIColor greenColor] CGColor];
    pathLayer.lineWidth = 30.0f;
    pathLayer.lineJoin = kCALineJoinBevel;
    
    [self.layer addSublayer:pathLayer];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 2.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    //Add animation
    [pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
    
    
    CAKeyframeAnimation *colorsAnimation = [CAKeyframeAnimation animationWithKeyPath:@"strokeColor"];
    colorsAnimation.values = [NSArray arrayWithObjects: (id)[UIColor blueColor].CGColor,
                              (id)[UIColor brownColor].CGColor, (id)[UIColor yellowColor].CGColor, (id)[UIColor orangeColor].CGColor, nil];
    colorsAnimation.keyTimes = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.25], [NSNumber numberWithFloat:0.5], [NSNumber numberWithFloat:0.75],[NSNumber numberWithFloat:1.0], nil];
    colorsAnimation.calculationMode = kCAAnimationPaced;
    colorsAnimation.removedOnCompletion = NO;
    colorsAnimation.fillMode = kCAFillModeForwards;
    colorsAnimation.duration = 3.0f;
    
    //Add animation
    [pathLayer addAnimation:colorsAnimation forKey:@"strokeColor"];
    
    UIBezierPath *axis_path = [UIBezierPath bezierPath];
    [axis_path moveToPoint:CGPointMake(20.0,500.0)];
    [axis_path addLineToPoint:CGPointMake(x, 501.0)];
    
    [axis_path moveToPoint:CGPointMake(20.5,500.0)];
    [axis_path addLineToPoint:CGPointMake(20.5, 130.0)];
    
    CAShapeLayer *axis_pathLayer = [CAShapeLayer layer];
    axis_pathLayer.path = axis_path.CGPath;
    axis_pathLayer.strokeColor = [[UIColor whiteColor] CGColor];
    axis_pathLayer.lineWidth = 1.0f;
    axis_pathLayer.lineJoin = kCALineJoinBevel;
    
    [self.layer addSublayer:axis_pathLayer];
    //Add animation
    [axis_pathLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
    
    
    
}


@end
