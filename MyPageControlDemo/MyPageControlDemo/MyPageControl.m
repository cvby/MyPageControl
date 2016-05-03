//
//  MyPageControl.m
//  CarBaDa
//
//  Created by admin on 15/12/22.
//  Copyright © 2015年 wyj. All rights reserved.
//

#import "MyPageControl.h"
#import "Masonry.h"

#define Point_NormalSize  5.0
#define Point_With  5.0
#define Point_CurrentSize 10.0
#define Point_NormalColor  [UIColor colorWithRed:199.0/255.0 green:203.0/255.0 blue:210.0/255.0 alpha:1.0]
#define Point_CurrentColor [UIColor colorWithRed:63.0/255.0 green:155.0/255.0 blue:234.0/255.0 alpha:1.0]

@implementation MyPageControl

- (instancetype)init:(int)pages currentPage:(int)current
{
    self = [super init];
    if (self) {
        for(int i=0;i<pages;i++)
        {
            self.userInteractionEnabled=YES;
            _numberOfPages=pages;
            _currentPage=current;
            UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag=(i+1);//tag不能为0
            btn.clipsToBounds=YES;
            [btn addTarget:self action:@selector(didPressedBtnPoint:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            if(i==current)
            {
                [btn setBackgroundColor:Point_CurrentColor];
                [self setBtnConstraints:btn index:i Size:Point_CurrentSize];
                btn.layer.cornerRadius=Point_CurrentSize/2.0;
            }else
            {
                [btn setBackgroundColor:Point_NormalColor];
                [self setBtnConstraints:btn index:i Size:Point_NormalSize];
                btn.layer.cornerRadius=Point_NormalSize/2.0;
            }
        }
        if(pages>0)
        {
            CGFloat with = (pages-1)*(Point_NormalSize+Point_With)+Point_CurrentSize;
            self.frame=CGRectMake(0, 0, with, 15);
        }
    }
    return self;
}

-(void)setBtnConstraints:(UIButton*)btn index:(int)index Size:(CGFloat)size{
    if(index==0){
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(size);
            make.height.mas_equalTo(size);
            make.left.equalTo(self.mas_left).with.offset(0);
            make.centerYWithinMargins.mas_equalTo(@0);
        }];
    }else
    {
        UIButton* perbtn=(UIButton*)[self viewWithTag:btn.tag-1];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(size);
            make.height.mas_equalTo(size);
            make.left.equalTo(perbtn.mas_right).with.offset(Point_With);
            make.centerYWithinMargins.mas_equalTo(@0);
        }];
    }
}

-(void)setCurrentPage:(int)currentPage{
    if(_currentPage!=currentPage)
    {
        //先把原来的置回去，再设置新的
        UIButton* perbtn=(UIButton*)[self viewWithTag:(_currentPage+1)];
        [perbtn setBackgroundColor:Point_NormalColor];
        UIButton* btn=(UIButton*)[self viewWithTag:(currentPage+1)];
        [btn setBackgroundColor:Point_CurrentColor];
        //去掉动画
        //把原来的置回去
        [perbtn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(Point_NormalSize);
            make.height.mas_equalTo(Point_NormalSize);
        }];
        perbtn.layer.cornerRadius=Point_NormalSize/2.0;
        //设置新的
        [btn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(Point_CurrentSize);
            make.height.mas_equalTo(Point_CurrentSize);
        }];
        btn.layer.cornerRadius=Point_CurrentSize/2.0;
    }
    _currentPage=currentPage;
}

-(IBAction)didPressedBtnPoint:(id)sender{
    UIButton* btn=(UIButton*)sender;
    self.currentPage=(int)(btn.tag-1);
    [self.delegate didPageChange:(int)(btn.tag-1)];
}

@end
