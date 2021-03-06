//
//  GTNormalTableViewCell.h
//  SampleApp
//
//  Created by bear on 2022/4/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class GTListItem;
@protocol GTNormalTableViewCellDelegate <NSObject>
-(void)tabelViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

@interface GTNormalTableViewCell : UITableViewCell

@property(nonatomic,weak,readwrite) id<GTNormalTableViewCellDelegate> delegate;
-(void)layoutTableViewCellWithItem:(GTListItem *)item;

@end



NS_ASSUME_NONNULL_END
