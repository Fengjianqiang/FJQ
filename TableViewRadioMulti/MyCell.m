//
//  MyCell.m
//  TableViewRadioMulti
//
//  Created by TZ on 2017/2/15.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "MyCell.h"

@interface MyCell()

@property (weak, nonatomic) IBOutlet UIImageView *img;

@end

@implementation MyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

/** 改变选中未选中的图片 */
- (void)changeSelectStatus:(BOOL)checked
{
    if (checked) {
        self.img.image = [UIImage imageNamed:@"ic_yuan_sel"];
    } else {
        self.img.image = [UIImage imageNamed:@"ic_yuan_nor"];
    }
//    self.checked = checked;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
