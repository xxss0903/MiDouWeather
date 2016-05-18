//
//  MDWHomeVC.m
//  MiDouWeather
//
//  Created by j on 16/5/4.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWHomeVC.h"
#import "MDWSettingsVC.h"
#import "MDWAnimator.h"
#import "MDWWeatherCard.h"
#import "MDWSqlite.h"
#import "MDWTools.h"
#import <POP.h>
#import <QuartzCore/QuartzCore.h>

#define kCityInfoTable @"cityInfo"
#define cardsCount 4

@interface MDWHomeVC () <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIButton *settingsBtn;

@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation MDWHomeVC
{
    CGPoint viewCenter;
    CGFloat offsetX;
    NSInteger currentIndex;
}

#pragma mark - 自定义方法
- (void)settingsBtnClicked:(id)sender
{
    // 创建数据库
    [self handleDatabase];
}

/**
 *  更新所有卡片状态
 */
- (void)updateAllCardsStatus
{
    CGFloat scale;
    CGPoint cardCenter;
    for (int i = 0; i < self.cards.count; i++) {
        MDWWeatherCard *card = (MDWWeatherCard *)self.cards[i];
        scale = [self calculateCardScaleWithIndex:i scaleFractor:self.scaleFractor];
        
        cardCenter = CGPointMake(self.view.center.x, self.view.center.y + labs(cardsCount - i - 1) * self.cardDistance);
        [self setCardScale:scale card:card];
        [self setCardCenter:cardCenter card:card];
    }
}

/**
 *  处理拖动手势
 *
 *  @param gesture 手势
 */
- (void)handlePan:(UIPanGestureRecognizer *)gesture
{
    
    
    CGPoint nowLocation = CGPointZero;
    // 开始拖动手势
    if (gesture.state == UIGestureRecognizerStateBegan) {
        nowLocation = [gesture locationInView:self.view];
        viewCenter = gesture.view.center;
        return;
    }
    // 拖动卡片
    if (gesture.state == UIGestureRecognizerStateChanged) {
        
        // 移动卡片
        CGPoint transition = [gesture translationInView:self.view];
        nowLocation = [gesture locationInView:gesture.view];
        gesture.view.transform = CGAffineTransformMakeTranslation(transition.x, transition.y);
        offsetX = fabs(gesture.view.transform.tx);
        
        // 设置卡片的旋转
        CGFloat angle = gesture.view.transform.tx / 360.f;

        [self setCardRotate:angle card:gesture.view];
        
    }
    // 结束拖动手势
    if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled || gesture.state == UIGestureRecognizerStateFailed) {
        NSLog(@"pan end");
        // 卡片偏移超过界限就消失，并且重置卡片状态
        if (offsetX < 120) {
            // 偏移小于100，则回到原始位置
            [UIView animateWithDuration:0.8 delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1 options:0 animations:^{
                gesture.view.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                
            }];
        } else {
            // 偏移大于100，继续移动直到消失
            [self.cards removeObject:[self.cards lastObject]];
            [gesture.view removeFromSuperview];
            
            // 添加卡片到视图，并且让卡片消失
            [self addCardWithSize:self.cardSize andCenter:self.view.center toCardsIndex:0];
            [self updateAllCardsStatus];
        }
    }
}

// 初始化数据
- (void)initialWeatherData
{
    // 获取城市信息
    
    // 获取天气预报信息
    
    
}

// 控制器跳转
- (void)jumpToSettingsVC
{
    MDWSettingsVC *settingsVC = [[MDWSettingsVC alloc] init];
    settingsVC.view.bounds = CGRectMake(0, 0, SCREENSIZE.width, SCREENSIZE.height/2);
    [self presentViewController:settingsVC animated:YES completion:nil];
    [self.navigationController pushViewController:settingsVC animated:YES];
}

/**
 *  初始化卡片
 */
- (void)setupCards
{
    // 开始创建卡片
    for (int i = 0; i < cardsCount; i ++ ) {
        [self addCardWithSize:self.cardSize andCenter:self.view.center toCardsIndex:i];
    }
}

// 添加单个卡片
- (void)addCardWithSize:(CGSize)size andCenter:(CGPoint)center toCardsIndex:(NSInteger)index
{
    MDWWeatherCard *card = [[MDWWeatherCard alloc] init];
    
    [card settingsClicked:^{
        [self presentViewController:[[MDWSettingsVC alloc] init] animated:YES completion:nil];
    }];
    
    CGFloat scale = [self calculateCardScaleWithIndex:index scaleFractor:self.scaleFractor];
    card.bounds = CGRectMake(0, 0, size.width , size.height);
    card.center = CGPointMake(self.view.center.x, self.view.center.y + card.bounds.size.height*2);
    
    center = CGPointMake(center.x, center.y + labs(cardsCount - index - 1) * self.cardDistance);
    [self setCardCenter:center card:card];
    [self setCardScale:scale card:card];
    // 添加到视图和数组中
    [self.view insertSubview:card atIndex:index];
    [self.cards insertObject:card atIndex:index];

    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [card addGestureRecognizer:pan];
}

/**
 *  计算卡片的缩放比例
 *
 *  @param index   第几张卡片
 *  @param fractor 缩放比例
 *
 *  @return 比例
 */
- (CGFloat)calculateCardScaleWithIndex:(NSInteger)index scaleFractor:(CGFloat)fractor
{
    CGFloat scale;
    
    scale = 1 - fractor * (cardsCount - index - 1);
    
    return scale;
}

/**
 *  设置卡片的大小，利用scale比例
 *
 *  @param scale 缩放比例
 *  @param card  卡片
 */
- (void)setCardScale:(CGFloat)scale card:(UIView *)card
{
    // 使用pop动画
    POPBasicAnimation *pop = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    pop.toValue = [NSValue valueWithCGSize:CGSizeMake(scale, scale)];
    pop.duration = 0.2f;
    [card.layer pop_addAnimation:pop forKey:@"cardScale"];
}

/**
 *  设置卡片旋转
 *
 *  @param angle 旋转角度
 *  @param card  卡片
 */
- (void)setCardRotate:(CGFloat)angle card:(UIView *)card
{
    card.transform = CGAffineTransformRotate(card.transform, angle);
}

- (void)setCardTransformIdentity:(UIView *)card
{
    card.transform = CGAffineTransformIdentity;
}

// 重置卡片中心
- (void)setCardCenter:(CGPoint)center card:(UIView *)card
{
    POPBasicAnimation *pop = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    pop.toValue = [NSValue valueWithCGPoint:center];
    pop.duration = 0.4f;

    [card pop_addAnimation:pop forKey:@"cardCenter"];
}

// 点偏移
- (CGPoint)pointTranslate:(CGPoint)start Scale:(CGFloat)scale
{
    CGPoint end = CGPointMake(start.x + scale * 50, start.y + scale * 50);
    
    return end;
}

- (void)subView:(UIView *)subView inView:(UIView *)view
{
    // 判断子视图是否还在父视图内
    
    
    
}

// 配置初始化参数
- (void)configInitialData
{
    self.scaleFractor = 0.1f;
    self.cardDistance = 40;
    self.cardSize = CGSizeMake(SCREENSIZE.width * 0.7, SCREENSIZE.height * 0.7);
}

#pragma mark 数据库操作
- (void)handleDatabase
{
    // 创建表单sql语句
    NSString *sql = [NSString stringWithFormat:@"CREATE TABLE %@ (cityName text, json text)", kCityInfoTable];
    [[MDWSqlite sharedMDWSqlite] executeNonQuery:sql];
    
    // 插入数据到表单
    // 获取网络数据
//    __block NSDictionary *retData = [NSDictionary dictionary];
//    [MDWTools getCityInfoListWithCityName:@"成都" andApikey:kApiKey success:^(id responseObject) {
//        retData = [responseObject valueForKey:@"retData"];
//        NSLog(@"%@", retData);
//        NSString *sqlInsert = [NSString stringWithFormat:@"INSERT INTO %@ (cityName, json) VALUES ('%@','%@')", kCityInfoTable, @"成都", retData ];
//        
//        [[MDWSqlite sharedMDWSqlite] executeNonQuery:sqlInsert];
//    
//    } failed:^(NSError *error) {
//        NSLog(@"erro = %@", error);
//    }];
    
    
    // 查询数据
    NSString *sqlSelect = [NSString stringWithFormat:@"SELECT json FROM %@ WHERE cityName='%@'", kCityInfoTable, @"成都"];
    NSDictionary *dict = [[[MDWSqlite sharedMDWSqlite] executeQuery:sqlSelect] firstObject];
    NSLog(@"%@", [dict valueForKey:@"json"]);
    
}

#pragma mark 系统方法
- (instancetype)init
{
    if (self = [super init]) {
        NSLog(@"init 方法");
        [self configInitialData];
//        self.transitioningDelegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.delegate = self;
    self.cards = [NSMutableArray array];
    
    self.view.backgroundColor = [UIColor orangeColor];
    self.settingsBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 25)];
    [self.settingsBtn setTitle:@"设置" forState:UIControlStateNormal];
    [self.settingsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.settingsBtn];
    [self.settingsBtn addTarget:self action:@selector(jumpToSettingsVC) forControlEvents:UIControlEventTouchUpInside];
    
    [self setupCards];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
