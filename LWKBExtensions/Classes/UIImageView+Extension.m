//
// Created by Luo Wei on 2017/4/4.
// Copyright (c) 2017 luowei. All rights reserved.
//

#import "UIImageView+Extension.h"


@implementation UIImageView (Extension)

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    for (CALayer *sub in layer.sublayers) {
        if ([sub.name isEqual:@"border-shape"]) {
            CGFloat borderHalf = (CGFloat) floor([(CAShapeLayer *) sub lineWidth] * .5);
            sub.frame = layer.bounds;
            [sub setBounds:CGRectInset(layer.bounds, borderHalf, borderHalf)];
            [sub setPosition:CGPointMake(CGRectGetMidX(layer.bounds),
                    CGRectGetMidY(layer.bounds))];
        }
    }
}

- (void)setBorder:(CGFloat)borderWidth color:(UIColor *)color {
    assert(self.frame.size.width == self.frame.size.height);
    for (CALayer *sub in [NSArray arrayWithArray:self.layer.sublayers]) {
        if ([sub.name isEqual:@"border-shape"]) {
            [sub removeFromSuperlayer];
            break;
        }
    }

    CGFloat borderHalf = (CGFloat) floor(borderWidth * .5);
    self.layer.cornerRadius = (CGFloat) (self.layer.bounds.size.width * .5);

    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    self.layer.delegate = (id <CALayerDelegate>) self;
    circleLayer.name = @"border-shape";
    [circleLayer setBounds:CGRectInset(self.bounds, borderHalf, borderHalf)];
    [circleLayer setPosition:CGPointMake(CGRectGetMidX(self.layer.bounds),
            CGRectGetMidY(self.layer.bounds))];
    [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:circleLayer.bounds] CGPath]];
    [circleLayer setStrokeColor:color.CGColor];
    [circleLayer setFillColor:[UIColor clearColor].CGColor];
    [circleLayer setLineWidth:borderWidth];

    {
        circleLayer.shadowOffset = CGSizeZero;
        circleLayer.shadowColor = [[UIColor whiteColor] CGColor];
        circleLayer.shadowRadius = borderWidth;
        circleLayer.shadowOpacity = .9f;
        circleLayer.shadowOffset = CGSizeZero;
    }

    // Add the sublayer to the image view's layer tree
    [self.layer addSublayer:circleLayer];

    // old variant
    //CALayer *layer = self.layer;
    //layer.masksToBounds = YES;
    //layer.cornerRadius = self.frame.size.width * 0.5;
    //layer.borderWidth = borderWidth;
    //layer.borderColor = color;
}

@end