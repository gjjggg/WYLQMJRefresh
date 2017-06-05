//
//  LQHeaderView.h
//  Refresh
//
//  Created by 郭洪安 on 2017/6/2.
//  Copyright © 2017年 UIViewCon. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
@interface LQHeaderView : UIView
#define QUAN_Y 8
@property (nonatomic , strong) UIView *leftView;
@property (nonatomic,strong) UIView * rightView;
-(void)viewwithwidth:(CGFloat)width;
@end
