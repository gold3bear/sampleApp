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
    
    [[AFHTTPSessionManager manager] GET:@"http://127.0.0.1:8080/hello" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"progress ...");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure");
    }];
//    NSString *urlString = @"http://localhost:8080";
//    NSURL *listURL = [NSURL URLWithString:urlString];
////    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
//    NSURLSession *session = [NSURLSession sharedSession];
////    __unused NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:listRequest];
//    NSURLSessionDataTask *dataTask= [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"%@",urlString);
//    }];
//    [dataTask resume];
}
@end
