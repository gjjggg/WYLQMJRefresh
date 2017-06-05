//
//  MJLQHeader.m
//  MJRefreshExample
//
//  Created by 郭洪安 on 2017/5/26.
//  Copyright © 2017年 小码哥. All rights reserved.
//

#import "MJLQHeader.h"
@interface MJLQHeader()
{
    LQHeaderView *_gifView;
    CGFloat BGRefreshViewH;
    CAAnimationGroup * groupTwoAnimation ;
    CAAnimationGroup * groupOneAnimation ;
    int stats;
}

@end


@implementation MJLQHeader

-(void)create{
    self.mj_h = 30+5+5+5;
    LQHeaderView *gifView = [[LQHeaderView alloc] init];
    gifView.mj_x = 0;
    gifView.mj_y = 0;
    gifView.mj_w = self.mj_w;
    gifView.mj_h = self.mj_h;
    [self addSubview:_gifView = gifView];
    [gifView viewwithwidth:self.mj_h];
    BGRefreshViewH =  self.mj_h -12-10;
    _gifView.contentMode = UIViewContentModeCenter;
    
}

#pragma mark - 实现父类的方法
- (void)prepare
{
    [super prepare];
    self.mj_h = 30+5+5+5;
    [self create];
    
    // 初始化间距
    //    self.labelLeftInset = 20;
}
- (void)placeSubviews
{
    [super placeSubviews];
    
}


- (void)setState:(MJRefreshState)state
{
    
    MJRefreshCheckState
    // 根据状态做事情
    if(state == MJRefreshStatePulling){
        
        [self fenli];
    }else if(state == MJRefreshStateRefreshing){
        
                [self oneYuanDian];
                [self twoYuanDian];
    }else if (state == MJRefreshStateIdle && stats!=102) {
        [self stop];
    }  else if (state == MJRefreshStateIdle && stats ==102) {
        [self fenli];;
    }
    
    
}
//分离动画
-(void)fenli
{
    
    stats =5;
    [UIView animateWithDuration:0.5
                     animations:^{
                         _gifView.leftView.frame = CGRectMake(SCREEN_WIDTH/2+9,BGRefreshViewH, QUAN_Y, QUAN_Y);
                         _gifView.rightView.frame = CGRectMake(SCREEN_WIDTH/2-9,BGRefreshViewH, QUAN_Y, QUAN_Y);
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }];
    
    
}
//重合动画
-(void)stop{
    stats=5;
    
    [UIView animateWithDuration:0.5 // 动画时长
                     animations:^{
                         [_gifView.rightView.layer removeAllAnimations];
                         [_gifView.leftView.layer removeAllAnimations];
                         _gifView.leftView.frame = CGRectMake(SCREEN_WIDTH/2,BGRefreshViewH, QUAN_Y, QUAN_Y);
                         _gifView.rightView.frame = CGRectMake(SCREEN_WIDTH/2,BGRefreshViewH, QUAN_Y, QUAN_Y);
                         
                     }
                     completion:^(BOOL finished) {
                         // 动画完成后执行
                         // code...https://git.coding.net/Super-Rabbit/ShunLianDemo.git
                         //                         [self oneYuanDian];
                         //                         [self twoYuanDian];
                         _gifView.leftView.frame = CGRectMake(SCREEN_WIDTH/2,BGRefreshViewH, QUAN_Y, QUAN_Y);
                         _gifView.rightView.frame = CGRectMake(SCREEN_WIDTH/2,BGRefreshViewH, QUAN_Y, QUAN_Y);
                     }];
    
}


//动画开始
-(void)oneYuanDian{
    //    //位移动画
    
    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH/2, BGRefreshViewH) radius:9 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    anima1.path = arcPath.CGPath;
    
    
    //组动画
    groupOneAnimation = [CAAnimationGroup animation];
    groupOneAnimation.animations = [NSArray arrayWithObjects:anima1, nil];
    groupOneAnimation.duration = 0.9f;
    groupOneAnimation.repeatCount= HUGE_VALF;
    [groupOneAnimation setRemovedOnCompletion:NO];
    [_gifView.leftView.layer addAnimation:groupOneAnimation forKey:@"groupAnimation"];
    
    
    
}
-(void)twoYuanDian{
    
    //    //位移动画
    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(SCREEN_WIDTH/2, BGRefreshViewH) radius:9 startAngle:M_PI endAngle:M_PI*3 clockwise:YES];
    anima1.path = arcPath.CGPath;
    //组动画
    groupTwoAnimation = [CAAnimationGroup animation];
    groupTwoAnimation.animations = [NSArray arrayWithObjects:anima1, nil];
    groupTwoAnimation.duration = 0.9f;
    groupTwoAnimation.repeatCount= HUGE_VALF;
    [groupTwoAnimation setRemovedOnCompletion:NO];
    [_gifView.rightView.layer addAnimation:groupTwoAnimation forKey:@"groupAnimation"];
    
    
}
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
    NSLog(@"pullingPercent   %lf",pullingPercent);
    NSString * string = [NSString stringWithFormat:@"%lf",pullingPercent];
    if(pullingPercent>1.5 && stats==5 ){
        [self oneYuanDian];
        [self twoYuanDian];
        stats=100;
        
    }if([string isEqualToString:@"0.000000"]){
        [self stopppp];
    }
    
}
- (void)endRefreshing
{
    [super endRefreshing];
    
    stats =102;
}
//重合动画
-(void)stopppp{
    stats=5;
    
    [UIView animateWithDuration:0.5 // 动画时长
                     animations:^{
                         [_gifView.rightView.layer removeAllAnimations];
                         [_gifView.leftView.layer removeAllAnimations];
                         //                         _gifView.leftView.frame = CGRectMake(SCREEN_WIDTH/2,BGRefreshViewH, QUAN_Y, QUAN_Y);
                         //                         _gifView.rightView.frame = CGRectMake(SCREEN_WIDTH/2,BGRefreshViewH, QUAN_Y, QUAN_Y);
                         
                     }
                     completion:^(BOOL finished) {
                         // 动画完成后执行
                         // code...https://git.coding.net/Super-Rabbit/ShunLianDemo.git
                         //                         [self oneYuanDian];
                         //                         [self twoYuanDian];
                         
                         _gifView.leftView.frame = CGRectMake(SCREEN_WIDTH/2,BGRefreshViewH, QUAN_Y, QUAN_Y);
                         _gifView.rightView.frame = CGRectMake(SCREEN_WIDTH/2,BGRefreshViewH, QUAN_Y, QUAN_Y);
                     }];
    
}
@end
