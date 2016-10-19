//
//  ViewController2.m
//  HCRefresh
//
//  Created by chenhao on 16/10/19.
//  Copyright © 2016年 chenhao. All rights reserved.
//

#import "ViewController2.h"
#import "HCRefresh.h"
#import "HCRefreshManager.h"
#import "MJRefresh.h"


@interface ViewController2 ()

@end

@implementation ViewController2
{
    UIScrollView  *_scrollView;
}

-(void)dealloc
{
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.title = @"title";
    self.view.backgroundColor = HC_UICOLOR_RGB(41, 47, 56);
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height + 200)];
    bgImageView.backgroundColor = [UIColor grayColor];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(bgImageView.bounds));
    scrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scrollView];
    [scrollView addSubview:bgImageView];
    _scrollView = scrollView;
    
    
    //*********添加刷新（selector方式）*********
    [scrollView hc_addHeaderRefreshWithTarget:self actionSelector:@selector(headerRefresh)];
    [scrollView hc_addFooterRefreshWithTarget:self actionSelector:@selector(footerRefresh)];
    
//    _scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    
    
}

-(void)headerRefresh
{
    NSLog(@"headerRefresh22");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //停止下拉刷新（不显示更新信息）
        //[_scrollView hc_stopHeaderRefresh];
        
        //停止下拉刷新（显示更新信息）
        [_scrollView hc_stopHeaderRefreshAndShowMessage:@"更新了10条信息"];
//        [_scrollView.mj_header endRefreshing];
        
    });
}

-(void)footerRefresh
{
    NSLog(@"footerRefresh22");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //停止底部刷新
        [_scrollView hc_stopFooterRefresh];
    });
}

@end
