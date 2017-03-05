//
//  ViewController.m
//  TableViewRadioMulti
//
//  Created by FJQ on 2017/2/15.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "ViewController.h"

#import "MyCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTable;
/** 数据源 */
@property (nonatomic, strong) NSMutableArray *dataSourse;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化数据源
    self.dataSourse = [NSMutableArray array];
    // 给数据源添加测试数据
    for (int i = 0; i < 30; i++) {
        NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
        [dataDic setValue:@"NO" forKey:@"checked"];
        [self.dataSourse addObject:dataDic];
    }
    // 注册cell
    [self.myTable registerNib:[UINib nibWithNibName:@"MyCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"MyCell"];
}

/** 全选与取消 点击事件 */
- (IBAction)chooceBntAction:(UIButton *)sender {
    
    // 当前可见的cell 改变 选中状态
    NSArray *indexPathArr = [NSArray arrayWithArray:[self.myTable indexPathsForVisibleRows]];
    
    for (int i = 0; i < indexPathArr.count; i++) {
        NSIndexPath *indexPath = indexPathArr[i];
        // 通过indexPath 获得指定cell
        MyCell *cell = (MyCell *)[self.myTable cellForRowAtIndexPath:indexPath];
        NSUInteger row = indexPath.row;
        NSMutableDictionary *dic = self.dataSourse[row];
        
        if ([sender.titleLabel.text isEqualToString:@"全选"]) {
            [dic setValue:@"YES" forKey:@"checked"];
            [cell changeSelectStatus:YES];
        } else {
            [dic setValue:@"NO" forKey:@"checked"];
            [cell changeSelectStatus:NO];
        }
    }
    
    if ([sender.titleLabel.text isEqualToString:@"全选"]) {
        for (NSMutableArray *dic in self.dataSourse) {
            [dic setValue:@"YES" forKey:@"checked"];
        }
        [sender setTitle:@"取消" forState:UIControlStateNormal];
    } else {
        for (NSMutableArray *dic in self.dataSourse) {
            [dic setValue:@"NO" forKey:@"checked"];
        }
        [sender setTitle:@"全选" forState:UIControlStateNormal];
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSourse.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    NSMutableDictionary *dic = self.dataSourse[indexPath.row];
    
    if ([[dic objectForKey:@"checked"] isEqualToString:@"YES"]) {
        [cell changeSelectStatus:YES];
    } else {
        [cell changeSelectStatus:NO];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSMutableDictionary *dic = self.dataSourse[indexPath.row];
    
    if ([[dic objectForKey:@"checked"] isEqualToString:@"YES"]) {
        [dic setValue:@"NO" forKey:@"checked"];
        [cell changeSelectStatus:NO];
    } else {
        [dic setValue:@"YES" forKey:@"checked"];
        [cell changeSelectStatus:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
