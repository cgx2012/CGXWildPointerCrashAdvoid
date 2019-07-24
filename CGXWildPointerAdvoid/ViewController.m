//
//  ViewController.m
//  CGXWildPointerAdvoid
//
//  Created by 陈桂鑫 on 2019/7/23.
//  Copyright © 2019 ZY. All rights reserved.
//

#import "ViewController.h"
#import "WildPointerAdvoid/WildPointerChecker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    startWildPointerCheck();
    
    UIButton *tmpBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    [tmpBtn addTarget:self action:@selector(tmpBtnClickd:) forControlEvents:UIControlEventTouchUpInside];
    tmpBtn.backgroundColor = [UIColor redColor];
    [tmpBtn setTitle:@"Button" forState:UIControlStateNormal];
    [self.view addSubview:tmpBtn];
}

- (void)tmpBtnClickd:(UIButton *)sender {
    UIView* testObj = [[UIView alloc] init];
    [testObj release];
    for (int i = 0; i < 10; i++) {
        UIView* testView = [[UIView alloc] initWithFrame:CGRectMake(0,200,CGRectGetWidth(self.view.bounds), 60)];
        [self.view addSubview:testView];
    }
    [testObj setNeedsLayout];
}


@end
