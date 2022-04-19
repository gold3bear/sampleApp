//
//  GTDeleteCellView.h
//  SampleApp
//
//  Created by bear on 2022/4/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTDeleteCellView : UIView
-(void)showDeleteViewFromPoint:(CGPoint) point clickBlock:(dispatch_block_t) clickBlock;
-(void)dismissDeleteView;
@end

NS_ASSUME_NONNULL_END
