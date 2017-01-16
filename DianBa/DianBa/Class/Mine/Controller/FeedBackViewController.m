//
//  FeedBackViewController.m
//  DianBa
//
//  Created by Hunter on 2017/1/9.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//
//
//意见反馈
//

#import "FeedBackViewController.h"
#import "FeedbackView.h"

@interface FeedBackViewController ()<UITextViewDelegate>

@property (nonatomic, strong) FeedbackView *feedBackView;
@end

@implementation FeedBackViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor =[UIColor whiteColor];
    self.navigationItem.title =@"意见反馈";
    [self feedBackView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"the-arrow-"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
}

- (void)backClick:(UIButton *)but{
    [self.navigationController popViewControllerAnimated:YES];
}
- (FeedbackView *)feedBackView{
    if (!_feedBackView) {
        _feedBackView =[[[NSBundle mainBundle] loadNibNamed:@"FeedbackView" owner:self options:nil] lastObject];
        [self.view addSubview:_feedBackView];
        _feedBackView.sd_layout.topSpaceToView(self.view,64).leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).bottomSpaceToView(self.view,0);
        _feedBackView.FeedBackText.delegate =self;
    }
    return _feedBackView;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSString *temp =[self.feedBackView.FeedBackText.text stringByReplacingCharactersInRange:range withString:text];
    NSLog(@"%ld",temp.length);
    self.feedBackView.TextNumber.text = [NSString stringWithFormat:@"%ld/300",temp.length];
    if (temp.length >= 400) {
//        self.feedBackView.FeedBackText.text = [temp substringToIndex:300];
        return NO;
    }
    
    return YES;
}

@end
