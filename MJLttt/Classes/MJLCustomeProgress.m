//
//  MJLCustomeProgress.m
//  MJLProDemo
//
//  Created by lyscds2017 on 2018/8/1.
//  Copyright © 2018年 miaojinliang. All rights reserved.
//

#import "MJLCustomeProgress.h"
@interface MJLCustomeProgress ()
@property (nonatomic,weak) CAShapeLayer *progressLayer;
@end
@implementation MJLCustomeProgress
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self createLayer];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createLayer];
    }
    return self;
}
- (void)createLayer
{
    self.layer.borderWidth = 1.;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    CAShapeLayer *mainLayer = [[CAShapeLayer alloc] init];
    mainLayer.frame = self.bounds;
    CGSize size = self.bounds.size;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, size.height/2.0)];
    [path addLineToPoint:CGPointMake(size.width, size.height/2.0)];
    mainLayer.path = path.CGPath;
    mainLayer.strokeStart = 0;
    mainLayer.strokeColor = [UIColor orangeColor].CGColor;
    mainLayer.strokeEnd = 0.7;
    mainLayer.lineWidth = size.height;
    [self.layer addSublayer:mainLayer];
    self.progressLayer = mainLayer;
}
- (void)setPercentum:(CGFloat)percentum
{
    _percentum = percentum;
    self.progressLayer.strokeEnd = percentum;
}
@end
