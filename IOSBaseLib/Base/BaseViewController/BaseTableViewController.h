//
//  BaseTableViewController.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/23.
//  Copyright © 2019 scc. All rights reserved.
//

#import "BaseViewController.h"
#import <MJRefresh.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>

/** tableView **/
@property (nonatomic, strong) UITableView *tableView;

/** tableView的数据 **/
@property (nonatomic, strong) NSMutableArray *dataSouce;

@property (nonatomic, assign) NSUInteger pageSize;

@property (nonatomic, assign) NSUInteger pageNum;

- (void)loadNewData;

- (void)loadMoreData;

@end

NS_ASSUME_NONNULL_END
