//
//  GTNormalTableViewCell.m
//  SampleApp
//
//  Created by bear on 2022/4/16.
//

#import "GTNormalTableViewCell.h"
#import "GTListItem.h"

@interface GTNormalTableViewCell ()

@property(nonatomic,strong,readwrite) UILabel *titleLabel;
@property(nonatomic,strong,readwrite) UILabel *sourceLabel;
@property(nonatomic,strong,readwrite) UILabel *commentLabel;
@property(nonatomic,strong,readwrite) UILabel *timeLabel;
@property(nonatomic,strong,readwrite) UIImageView *rightImageView;
@property(nonatomic,strong,readwrite) UIButton *deleteButton;



@end


@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 280, 50)];
            self.titleLabel.numberOfLines =2;
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(305, 15, 70, 70)];
            self.rightImageView.backgroundColor = [UIColor lightGrayColor];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFill;
            self.rightImageView.clipsToBounds = YES;
            self.rightImageView;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 70, 50, 20)];
            //            self.sourceLabel.backgroundColor = [UIColor  redColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            
            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 50, 20)];
            //            self.commentLabel.backgroundColor = [UIColor  redColor];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 70, 50, 20)];
            //            self.timeLabel.backgroundColor = [UIColor  redColor];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
//        [self.contentView addSubview:({
//            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 70, 20, 20)];
//            [self.deleteButton setTitle:@"x" forState:UIControlStateNormal];
//            [self.deleteButton setTitle:@"v" forState:UIControlStateHighlighted];
//            self.deleteButton.backgroundColor = [UIColor grayColor];
//            self.deleteButton.layer.cornerRadius =10;
//            self.deleteButton.layer.masksToBounds = YES;
//            self.deleteButton.layer.borderWidth =2;
//            
//            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
//            self.deleteButton;
//        })];
    }
    return self;
    
}

-(void)layoutTableViewCellWithItem:(GTListItem *)item{
    bool hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:item.uniquekey];
    if(hasRead){
        self.titleLabel.textColor = [UIColor lightGrayColor];
    }else{
        self.titleLabel.textColor = [UIColor blackColor];
    }
    self.titleLabel.text = item.title;
    self.sourceLabel.text = item.authorName;
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = item.category;
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = item.date;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
#warning image
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]];
    UIImage *image = [UIImage imageWithData:imageData];
    self.rightImageView.image = image;
}

-(void)deleteButtonClick{
    //    NSLog(@"deleteButtonClick");
    if(self.delegate && [self.delegate respondsToSelector:@selector(tabelViewCell:clickDeleteButton:)]){
        [self.delegate tabelViewCell:self clickDeleteButton:self.deleteButton];
    }
}



@end
