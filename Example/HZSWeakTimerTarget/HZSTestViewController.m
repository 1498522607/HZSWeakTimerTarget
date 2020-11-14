//
//  HZSTestViewController.m
//  HZSWeakTimerTarget_Example
//
//  Created by hzsMac on 2020/11/14.
//  Copyright © 2020 hzsMac. All rights reserved.
//

#import "HZSTestViewController.h"
#import "HZSWeakTimerTarget.h"


@interface HZSTestViewController ()
@property(nonatomic, strong)UIScrollView * scrollView;

@property(strong, nonatomic) NSTimer * timer;
@property(weak, nonatomic) NSTimer * timer2;
@end

@implementation HZSTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.scrollView];
    self.scrollView.frame = self.view.bounds;
    
    UIView * redView = [[UIView alloc] init];
    [self.scrollView addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
    [redView setFrame:CGRectMake(0, 0, 1000, 1000)];
    self.scrollView.contentSize = CGSizeMake(1000, 1000);
    
    self.timer = [HZSWeakTimerTarget scheduledTimerWithTimeInterval:1 userInfo:@"kai" repeats:YES runLoopMode:NSRunLoopCommonModes block:^(id userInfo) {
        NSLog(@"%@", userInfo);
    }];
    
    self.timer2 = [HZSWeakTimerTarget scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:@"VVV" repeats:YES runLoopMode:NSRunLoopCommonModes];
    
}

- (void)timerAction:(id)userinfo {
    NSLog(@"%@", userinfo);
}


- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}


- (void)dealloc {
    [self.timer invalidate];
    [self.timer2 invalidate];
}

@end
