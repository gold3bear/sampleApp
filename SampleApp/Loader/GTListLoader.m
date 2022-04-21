//
//  GTListLoader.m
//  SampleApp
//
//  Created by bear on 2022/4/21.
//

#import "GTListLoader.h"

@implementation GTListLoader
-(void)loadListData{
    NSString *urlString = @"https://www.google.com/search?q=xcode+vim+site:developer.apple.com&sxsrf=APq-WBs3t06nnYtWEZQjffFbw4L8eZeyoA:1650541569542&sa=X&ved=2ahUKEwi738G_iqX3AhUJmFYBHRilBrsQrQIoBHoECBAQBQ&biw=1920&bih=973&dpr=1";
    __unused NSURL *listURL = [NSURL URLWithString:urlString];
    
    NSLog(@"%@",urlString);
}
@end
