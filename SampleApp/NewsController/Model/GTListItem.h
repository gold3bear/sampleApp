//
//  GTListItem.h
//  SampleApp
//
//  Created by bear on 2022/4/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTListItem : NSObject <NSSecureCoding>
@property(nonatomic,strong,readwrite)NSString *category;
@property(nonatomic,strong,readwrite)NSString *picUrl;
@property(nonatomic,strong,readwrite)NSString *uniquekey;
@property(nonatomic,strong,readwrite)NSString *title;
@property(nonatomic,strong,readwrite)NSString *date;
@property(nonatomic,strong,readwrite)NSString *authorName;
@property(nonatomic,strong,readwrite)NSString *articleUrl;
@property(nonatomic,strong,readwrite)NSString *isContent;

-(void)configWithDictionary:(NSDictionary *)dictionary;
    
@end

NS_ASSUME_NONNULL_END
