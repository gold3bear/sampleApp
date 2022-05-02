//
//  GTListItem.m
//  SampleApp
//
//  Created by bear on 2022/4/23.
//

#import "GTListItem.h"

@implementation GTListItem


#pragma public NSSecureCoding Method
- (nullable instancetype)initWithCoder:(NSCoder *)coder{
    self = [super init];
    if(self){
        self.category = [coder decodeObjectForKey:@"category"];
        self.picUrl = [coder decodeObjectForKey:@"picUrl"];
        self.uniquekey = [coder decodeObjectForKey:@"uniquekey"];
        self.title = [coder decodeObjectForKey:@"title"];
        self.date =[coder decodeObjectForKey:@"date"];
        self.authorName = [coder decodeObjectForKey:@"authorName"];
        self.articleUrl = [coder decodeObjectForKey:@"articleUrl"];
        self.isContent =[coder decodeObjectForKey:@"isContent"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.picUrl forKey:@"picUrl"];
    [coder encodeObject:self.uniquekey forKey:@"uniquekey"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.authorName forKey:@"authorName"];
    [coder encodeObject:self.articleUrl forKey:@"articleUrl"];
    [coder encodeObject:self.isContent forKey:@"isContent"];
}
//Class property 'supportsSecureCoding' requires method 'supportsSecureCoding' to be defined - use @dynamic or provide a method implementation in this class implementation
+(BOOL)supportsSecureCoding{
    return YES;
}

#pragma public method

-(void)configWithDictionary:(NSDictionary *)dictionary{
#warning 类型是否匹配
    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.uniquekey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date =[dictionary objectForKey:@"date"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
    self.isContent =[dictionary objectForKey:@"is_content"];
}

@end
