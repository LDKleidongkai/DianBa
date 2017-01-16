//
//  FeedbackView.h
//  DianBa
//
//  Created by Hunter on 2017/1/9.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedbackView : UIView

/**
 文字字数
 */
@property (weak, nonatomic) IBOutlet UILabel *TextNumber;

/**
 意见反馈
 */
@property (weak, nonatomic) IBOutlet UITextView *FeedBackText;

/**
 提交按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *CommitButton;
@end
