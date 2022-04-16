//
//  GTRecommendViewController.m
//  SampleApp
//
//  Created by bear on 2022/4/5.
//

#import "GTRecommendViewController.h"

@interface GTRecommendViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate>

@end

@implementation GTRecommendViewController

- (instancetype)init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"discover"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"discover_sel"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    NSArray *colorArray = @[[UIColor redColor],[UIColor blueColor],[UIColor greenColor],[UIColor yellowColor],[UIColor brownColor]];
    for (int i=0; i<5; i++) {
        [scrollView addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
            [view addSubview:({
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
                view.backgroundColor = [UIColor yellowColor];
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boxClick)];
                [view addGestureRecognizer:tapGesture];
                tapGesture.delegate = self;
                view;
            })];
            
            
            view.backgroundColor = [colorArray objectAtIndex:i];
            view;
        })];
    }
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
//    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll - %f",scrollView.contentOffset.x);
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}
-(void)boxClick{
    NSLog(@"boxClick");
}
// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"scrollViewWillBeginDragging - %f",scrollView.contentOffset.x);
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset API_AVAILABLE(ios(5.0)){
    NSLog(@"scrollViewWillEndDragging - %f",scrollView.contentOffset.x);
    
}




@end
