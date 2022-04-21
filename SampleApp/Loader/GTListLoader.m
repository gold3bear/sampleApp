//
//  GTListLoader.m
//  SampleApp
//
//  Created by bear on 2022/4/21.
//

#import "GTListLoader.h"

@implementation GTListLoader
-(void)loadListData{
    NSString *urlString = @"http://localhost:8080";
    NSURL *listURL = [NSURL URLWithString:urlString];
//    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listURL];
    NSURLSession *session = [NSURLSession sharedSession];
//    __unused NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:listRequest];
    NSURLSessionDataTask *dataTask= [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",urlString);
    }];
    [dataTask resume];
}
@end
