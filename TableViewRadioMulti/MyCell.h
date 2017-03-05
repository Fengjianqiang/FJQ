//
//  MyCell.h
//  TableViewRadioMulti
//
//  Created by FJQ on 2017/2/15.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell

/** 单选可直接通过属性控制 */
//@property (nonatomic, assign) BOOL checked;

- (void)changeSelectStatus:(BOOL)checked;

@end
