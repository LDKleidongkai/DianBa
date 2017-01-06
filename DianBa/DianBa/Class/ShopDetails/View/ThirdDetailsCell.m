//
//  ThirdDetailsCell.m
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "ThirdDetailsCell.h"

@implementation ThirdDetailsCell

- (void)awakeFromNib{
    [super awakeFromNib];
    self.icon.layer.masksToBounds = YES;
    self.icon.layer.cornerRadius = 15;
}

- (void)setCommentD:(CommentDetails *)commentD{
    _commentD = commentD;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:commentD.photo] placeholderImage:[UIImage imageNamed:@"图片预编译"]];
    self.nickName.text = commentD.username;
    self.time.text = commentD.creat_time;
    self.commentLabel.text = commentD.content;
}

@end
