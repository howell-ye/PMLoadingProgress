//
//  PMViewController.m
//  PMLoadingProgress
//
//  Created by yezhihao on 03/03/2021.
//  Copyright (c) 2021 yezhihao. All rights reserved.
//

#import "PMViewController.h"
#import "PMLoadingProgressView.h"

@interface PMViewController ()

@end

@implementation PMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(10, 120, 200, 40);
    testBtn.backgroundColor = [UIColor blueColor];
    [testBtn setTitle:@"测试" forState:UIControlStateNormal];
    testBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [testBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    testBtn.layer.cornerRadius = 5.0;
    [testBtn addTarget:self action:@selector(testAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)testAction:(UIButton *)button {
    [PMLoadingProgressView showClearLoadingInView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [PMLoadingProgressView dismissLoadingInView:self.view];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
