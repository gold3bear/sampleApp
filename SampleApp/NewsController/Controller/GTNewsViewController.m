//
//  ViewController.m
//  SampleApp
//
//  Created by bear on 2022/3/29.
//

#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteCellView.h"
#import "GTListLoader.h"
#import "GTListItem.h"


@interface GTNewsViewController ()<UITableViewDataSource,UITableViewDelegate,GTNormalTableViewCellDelegate>
@property(nonatomic,strong,readwrite) UITableView *tableView;
@property(nonatomic,strong,readwrite) NSArray<GTListItem*> *dataArray;
@property(nonatomic,strong,readwrite) GTListLoader *listLoader;

@end

@implementation GTNewsViewController

#pragma mark - life cycle
- (instancetype)init{
    self = [super init];

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
  
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    
    [self.view addSubview:_tableView];
    
    self.listLoader = [GTListLoader new];
    __weak typeof(self) wself = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
        __strong typeof(wself) strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
        NSLog(@"");
       
    }];
}
# pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GTListItem *item = [_dataArray objectAtIndex:indexPath.row];
    GTDetailViewController *controller = [ [GTDetailViewController alloc] initWithUrlString:item.articleUrl];
    controller.title = [NSString stringWithFormat:@"%@",item.title];
    controller.view.backgroundColor = [UIColor lightGrayColor];
    [self.navigationController pushViewController:controller animated:YES];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.uniquekey];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    
    if(!cell){
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id" ];
        cell.delegate = self;
    }
    
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    
    //系统默认文字和图标
    //    cell.textLabel.text = [NSString stringWithFormat:@"主标题-%@",@(indexPath.row)];
    //    cell.detailTextLabel.text = @"副标题";
    //    cell.imageView.image = [UIImage imageNamed:@"video"];
    return cell;
}

-(void)tabelViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton{
//    GTDeleteCellView *view = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
//    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
//    __weak typeof(self) wself = self;
//    [view showDeleteViewFromPoint:rect.origin clickBlock:^{
//        __strong typeof(self) strongSelf = wself;
//        [strongSelf.dataArray removeLastObject];
//        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
//        //        NSLog(@"111l");
//    }];
}



//-(void)pushController{
//    UIViewController *viewController = [UIViewController new];
//    viewController.view.backgroundColor = [UIColor whiteColor];
//    viewController.navigationItem.title = @"内容";
//    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
//
//
//    [self.navigationController pushViewController:viewController animated:YES];
//}


@end
