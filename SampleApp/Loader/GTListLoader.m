//
//  GTListLoader.m
//  SampleApp
//
//  Created by bear on 2022/4/21.
//

#import "GTListLoader.h"
#import <AFNetworking.h>

@implementation GTListLoader
-(void)loadListData{
    
//    [[AFHTTPSessionManager manager] GET:@"http://127.0.0.1:8080/data.json" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"progress ...");
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"success");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"failure");
//    }];
    NSString *urlString = @"https://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    NSURL *listURL = [NSURL URLWithString:urlString];
//    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    NSURLSession *session = [NSURLSession sharedSession];
//    __unused NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:listRequest];
    NSURLSessionDataTask *dataTask= [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:nil error:nil];
        
        
        NSLog(@"%@",urlString);
    }];
    [dataTask resume];
}
@end
