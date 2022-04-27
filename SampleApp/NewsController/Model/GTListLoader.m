//
//  GTListLoader.m
//  SampleApp
//
//  Created by bear on 2022/4/21.
//

#import "GTListLoader.h"
#import <AFNetworking.h>
#import "GTListItem.h"

@implementation GTListLoader
-(void)loadListDataWithFinishBlock:(GTListLoaderFinishBlock) finishBlock{
    //    NSString *urlString = @"https://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSString *urlString = @"http://127.0.0.1:8080/data.json";
    NSURL *listURL = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask= [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
#warning 类型检查
        NSDictionary *result =(NSDictionary *)[((NSDictionary *)jsonObj) objectForKey:@"result"];
        
        NSArray *dataArray = [result objectForKey:@"data"];
        NSMutableArray *listItemArray = @[].mutableCopy;
        for (NSDictionary *info in dataArray) {
            GTListItem *listItem = [GTListItem new];
            [listItem configWithDictionary:info];
            [listItemArray addObject:listItem];
        }
        //主线程调用
        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishBlock){
                finishBlock(error == nil,listItemArray.copy);
            }
        });
        
        
    }];
    [dataTask resume];
}
@end
