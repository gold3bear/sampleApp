//
//  GTDeleteCellView.h
//  SampleApp
//
//  Created by bear on 2022/4/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 删除弹窗
@interface GTDeleteCellView : UIView

/// 展示删除弹框
/// @param point 删除按钮的坐标
/// @param clickBlock 回调的动作
-(void)showDeleteViewFromPoint:(CGPoint) point clickBlock:(dispatch_block_t) clickBlock;
-(void)dismissDeleteView;
@end

NS_ASSUME_NONNULL_END
