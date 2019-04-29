//
//  BaseTableViewController.m
//  IOSBaseLib
//
//  Created by scc on 2019/4/23.
//  Copyright © 2019 scc. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]init];
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    [self initHeaderRefresh];
    [self initFooterRefresh];
    [self.view addSubview:self.tableView];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

- (void)initHeaderRefresh
{
//    NSMutableArray * images = [NSMutableArray array];
//    for (int i = 1; i < 6; i++) {
//        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"刷新加载动图%d", i]]];
//    }
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
//    header.lastUpdatedTimeLabel.hidden = YES;
//    header.stateLabel.hidden = YES;
//    /** 普通闲置状态 */
//    [header setImages:images duration:0.5 forState:MJRefreshStateIdle];
//    /** 松开就可以进行刷新的状态 */
//    [header setImages:images duration:0.5 forState:MJRefreshStatePulling];
//    /** 正在刷新中的状态 */
//    [header setImages:images duration:0.5 forState:MJRefreshStateRefreshing];
    self.tableView.mj_header = header;
}

- (void)initFooterRefresh
{
    WeakSelf weakSelf = self;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:@"没有更多了" forState:MJRefreshStateNoMoreData];
    self.tableView.mj_footer = footer;
}

- (void)loadNewData
{
    
}

- (void)loadMoreData
{
    
}

- (NSMutableArray *)dataSouce
{
    if (!_dataSouce) {
        self.dataSouce = [NSMutableArray array];
    }
    return _dataSouce;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSouce.count;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"contentOffset"]) {
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
        if (offset.y < 0.f) {
            CGFloat scale = fabs(offset.y) / 55.f;
            if (offset.y <= -55.f) {
                scale = 1.0;
            }
            ((MJRefreshGifHeader *)self.tableView.mj_header).gifView.transform = CGAffineTransformMakeScale(scale, scale);
        }
    }
}

- (void)dealloc
{
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
}

@end
