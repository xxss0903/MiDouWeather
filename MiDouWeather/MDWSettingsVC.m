//
//  MDWSettingsVC.m
//  MiDouWeather
//
//  Created by j on 16/5/4.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWSettingsVC.h"
#import "MDWBaseTableView.h"
#import "MDWSettingsCell.h"
#import "FixedHeight.h"
#import "MDWAnimator.h"

@interface MDWSettingsVC () <UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) MDWBaseTableView *settingsTable;
@property (nonatomic, strong) UINavigationBar *naviBar;
@property (nonatomic, strong) MDWAnimator *animator;

@end

@implementation MDWSettingsVC

#pragma mark - 控制器动画代理方法
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    NSLog(@"presenting animator ");
    _animator.animatorType = AnimatorTypePresent;
    return _animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    NSLog(@"dismiss animator");
    _animator.animatorType = AnimatorTypeDismiss;
    return _animator;
}


#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"这是一个cell" ;
    switch (indexPath.row) {
        case 0:
        {
            MDWSettingsCell *pushCell = [[MDWSettingsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            pushCell.textLabel.text = @"推送";
            return pushCell;
        }
            break;
        case 1:
        {
            cell.textLabel.text = @"分享天气";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
            break;
        case 2:
        {
            cell.textLabel.text = @"关于";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
            break;
        case 3:
        {
            cell.textLabel.text = @"检测更新";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell;
        }
            break;
            
        default:
            return cell;
            break;
    }
}

#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.f;
}

#pragma mark - 按钮点击方法
- (void)backBtnClicked:(id)sender
{
    NSLog(@"back btn clicked ...");
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 系统方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        _animator = [[MDWAnimator alloc] init];
    }
    return self;
}

- (CGSize)preferredContentSize
{
    return CGSizeMake(SCREENSIZE.width, SCREENSIZE.height / 2);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.transitioningDelegate = self;
    self.modalPresentationStyle = UIModalPresentationCustom;
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor purpleColor];
    CGRect tableRect = CGRectMake(0, NAVI_HEIGHT, SCREEN_SIZE.width, SCREEN_SIZE.height/2-NAVI_HEIGHT);
    self.settingsTable = [[MDWBaseTableView alloc] initWithFrame:tableRect];
    [self.view addSubview:self.settingsTable];
    self.settingsTable.dataSource = self;
    
    // 添加导航
    self.naviBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, NAVI_HEIGHT)];
    [self.view addSubview:self.naviBar];
    
    // 导航栏左边天假返回
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backBtnClicked:)];
    
    UINavigationItem *naviItem = [[UINavigationItem alloc] initWithTitle:@"返回"];
    naviItem.leftBarButtonItem = backBtn;
    
    [self.naviBar pushNavigationItem:naviItem animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
