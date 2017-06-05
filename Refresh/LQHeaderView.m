//
//  LQHeaderView.m
//  Refresh
//
//  Created by 郭洪安 on 2017/6/2.
//  Copyright © 2017年 UIViewCon. All rights reserved.
//

#import "LQHeaderView.h"

@interface LQHeaderView()

@end
@implementation LQHeaderView

-(void)viewwithwidth:(CGFloat)width{
    
    CGFloat with =  width-12-10;
    _leftView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, with,QUAN_Y,QUAN_Y)];
    _leftView.backgroundColor = [UIColor redColor];
    _leftView.layer.masksToBounds = YES;
    _leftView.layer.cornerRadius =QUAN_Y/2;
    [self  addSubview:_leftView];
    
    _rightView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, with,QUAN_Y,QUAN_Y)];
    _rightView.backgroundColor = [UIColor blueColor];
    _rightView.layer.masksToBounds = YES;
    _rightView.layer.cornerRadius =QUAN_Y/2;
    [self  addSubview:_rightView];
    
}

@end
