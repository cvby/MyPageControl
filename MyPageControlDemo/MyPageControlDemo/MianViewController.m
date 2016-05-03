//
//  MianViewController.m
//  MyPageControlDemo
//
//  Created by admin on 16/5/3.
//  Copyright © 2016年 李政. All rights reserved.
//

#import "MianViewController.h"
#import "MyPageControl.h"

@interface MianViewController ()

@property(nonatomic,strong)MyPageControl* myPageControl;
@end

@implementation MianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myPageControl=[[MyPageControl alloc]init:5 currentPage:0];
    CGSize pageControlSize = _myPageControl.frame.size;
    _myPageControl.frame = CGRectMake(100, 100, pageControlSize.width, pageControlSize.height);
    [self.view addSubview:_myPageControl];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didPressPrevious:(id)sender {
    if(_myPageControl.currentPage>0)
    {
        _myPageControl.currentPage--;
    }else
    {
        _myPageControl.currentPage=4;
    }
}

- (IBAction)didPressNext:(id)sender {
    if(_myPageControl.currentPage<4)
    {
        _myPageControl.currentPage++;
    }else
    {
        _myPageControl.currentPage=0;
    }
}
@end
