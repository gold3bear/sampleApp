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
    NSArray<GTListItem *> *listData = [self _readDataFromLocal];

    if(listData){
        finishBlock(YES,listData);
    }
    
    __weak typeof(self) weakSelf = self;
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
//        存储网络数据到本地
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf _archiveListDataWithArray:listItemArray.copy];
        
        //主线程调用
        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishBlock){
                finishBlock(error == nil,listItemArray.copy);
            }
        });


    }];
    [dataTask resume];
//    [self _archiveListDataWithArray];
}

-(NSArray<GTListItem *> *)_readDataFromLocal{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *cachePath = [pathArray firstObject];
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData/list"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSData *listData = [fileManager contentsAtPath:dataPath];
    
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:listData error:nil];
    if([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0){
        return (NSArray<GTListItem *> *)unarchiveObj;
    }else{
        return nil;
    }
    
}

-(void)_archiveListDataWithArray:(NSArray<GTListItem *> *)array{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *cachePath = [pathArray firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
    
    //创建文件
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
//    NSData *listData = [@"abc" dataUsingEncoding:NSUTF8StringEncoding];
//    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
//   存NSUserDefault

    //从数据读取,反序列化
    NSData *readListData = [fileManager contentsAtPath:listDataPath];
 
    //查询文件
    BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    
    [[NSUserDefaults standardUserDefaults] setObject:listData forKey:@"listData"];
    NSData *testListData = [[NSUserDefaults standardUserDefaults] dataForKey:@"listData"];
    
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:testListData error:nil];
    
//    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
//    [fileHandler seekToEndOfFile];
//    [fileHandler writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//    [fileHandler synchronizeFile];
//    [fileHandler closeFile];
    
//    NSLog(@"fileExist %d",fileExist);
}
@end
