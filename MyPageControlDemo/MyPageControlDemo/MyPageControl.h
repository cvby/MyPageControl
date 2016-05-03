//
//  MyPageControl.h
//  CarBaDa
//
//  Created by admin on 15/12/22.
//  Copyright © 2015年 wyj. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyPageControlDelegate <NSObject>

-(void)didPageChange:(int)CurrentPage;

@end

@interface MyPageControl : UIView

@property(nonatomic,assign) int numberOfPages;          // default is 0
@property(nonatomic,assign) int currentPage;            // default is 0. value pinned to 0..numberOfPages-1
@property(nonatomic,strong) UIColor *pageIndicatorTintColor;
@property(nonatomic,strong) UIColor *currentPageIndicatorTintColor;
@property(nonatomic,assign) id<MyPageControlDelegate> delegate;

- (instancetype)init:(int)pages currentPage:(int)current;

@end
