//
//  BDSlaunchViewController.m
//  MagpieLove
//
//  Created by MrChenMj on 2017/3/17.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import "BDSlaunchViewController.h"
#define kStartImageCache [NSString stringWithFormat:@"%@/Library/Caches/startImageCache.plist",NSHomeDirectory()] //启动图缓存地址

@interface ImgItem : NSObject
@property(nonatomic,strong)NSString *ios_960;
@property(nonatomic,strong)NSString *ios_1136;
@property(nonatomic,strong)NSString *ios_1334;
@property(nonatomic,strong)NSString *ios_2208;

@end

@implementation ImgItem



@end

@interface BDSlaunchViewController ()
{
    UIImageView *_launchImage;
    NSTimer *timer;
}
@property (nonatomic,strong) NSString *themImg;
@property(nonatomic,strong)ImgItem *iteMl;
@end

@implementation BDSlaunchViewController
@synthesize iteMl;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView  *vire =[[UIView alloc]initWithFrame:CGRectMake(0,0, kDScreenWidth, kDScreenHeight)];
    [self.view addSubview:vire];
    _launchImage = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, kDScreenWidth, kDScreenHeight)];
    NSString *imageName = @"";
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        if (IS_IPHONE5) {
            imageName = @"LaunchImage-700-568h";
        }else if (IS_IPHONE6){
            imageName = @"LaunchImage-800-667h";
        }else if (IS_IPHONE6PLAS){
            imageName = @"LaunchImage-800-Portrait-736h";
        }else if (IS_IPhoneX){
            imageName = @"LaunchImage-1100-Portrait-2436h";
        }
        else {
            imageName = @"LaunchImage-700";
        }
    }else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        imageName = @"ipad2";
    }
    _launchImage.image = [UIImage imageNamed:imageName];
    [vire addSubview:_launchImage];
    
    [[NSBundle mainBundle] pathForResource:@"Assets" ofType:@"xcassets"];
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnTap)];
    [vire addGestureRecognizer:tap];
    [self loadeData];
}
- (void)loadeData
{
    [self startTimeCount];
}
-(void)startTimeCount{
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                             target:self
                                           selector:@selector(tiaoguoAction)
                                           userInfo:nil
                                            repeats:NO];
}
- (void)creatUIOne{
    NSString *imgUrl=@"";
    //默认图
    if (IS_IPHONE4) {

        imgUrl = iteMl.ios_960;
    }
    if (IS_IPHONE5) {

        imgUrl = iteMl.ios_1136;
    }
    
    if (IS_IPHONE6) {

        imgUrl = iteMl.ios_1334;
    }
    if (IS_IPHONE6PLAS) {
        imgUrl = iteMl.ios_2208;
    }
    [_launchImage sd_setImageWithURL:[NSURL URLWithString:imgUrl]placeholderImage:IMAGE(self.themImg)];
}


- (void)creatUI{
    NSString *imgUrl=@"";
    //默认图
    if (IS_IPHONE4) {
        //        _launchImage sd_setImageWithURL:<#(NSURL *)#> placeholderImage:<#(UIImage *)#>
        imgUrl = iteMl.ios_960;
    }
    if (IS_IPHONE5) {
        //        _launchImage.image = //[UIImage imageNamed:@"640_1136L"];
        imgUrl = iteMl.ios_1136;
    }
    
    if (IS_IPHONE6) {
        //        _launchImage.image = [UIImage imageNamed:@"750_1334L"];
        imgUrl = iteMl.ios_1334;
    }
    if (IS_IPHONE6PLAS) {
        //        _launchImage.image = [UIImage imageNamed:@"1242_2208L"];
        imgUrl = iteMl.ios_2208;
    }
    //删除启动图 by supr
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:kStartImageCache])
    {
        NSError *error;
        BOOL result = [fileManager removeItemAtPath:kStartImageCache error:&error];
        if(!result)
        {
            kYLog(5,@"删除启动图失败!\n%@", error);
        }
    }
    [self downloadWebImage:imgUrl];
}
#pragma mark - 下载网络图片
- (void)downloadWebImage:(NSString *)path
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_global_queue(0,0), ^{
        NSMutableDictionary *imageDict=[[NSMutableDictionary alloc]initWithContentsOfFile:kStartImageCache];
        //        NSDictionary *imageDict[NSDictionary dictionaryWithContentsOfFile:kStartImageCache];
        if (imageDict==nil || ![path isEqualToString:imageDict[@"path"]]) {
            SDWebImageManager *manager = [SDWebImageManager sharedManager];
            [manager downloadImageWithURL:[NSURL URLWithString:path] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                if (image) {
                    [imageDict removeAllObjects];
                    [imageDict writeToFile:kStartImageCache atomically:YES];
                    
                    NSDictionary *dict = @{@"path":path,@"data":[self dataWithImage:image]};
                    [dict writeToFile:kStartImageCache atomically:YES];
                    //  @{@"path":path,@"data":[self dataWithImage:image]}
                }
            }];
        }
    });
}
#pragma mark - 得到图片data数据
- (NSData *)dataWithImage:(UIImage *)image{
    NSData *data=UIImageJPEGRepresentation(image, 0.75);
    if (data==nil) {
        data=UIImagePNGRepresentation(image);
    }
    return data;
    //    NSData *data=UIImagePNGRepresentation(image);
    //    if (data==nil) {
    //        data=UIImageJPEGRepresentation(image, 0);
    //    }
}
- (void)btnTap
{
    if (self.blockBtnTag) {
        self.blockBtnTag(0);
    }
}
- (void)dealloc
{
    self.blockBtnTag = nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    if (IOS_7) {
    //        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    //    }
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    if (IOS_7) {
    //        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    //    }
}
-(void)tiaoguoAction{
    [timer invalidate];
    [self goinRootVC];
}

- (void)goinRootVC
{
    if (self.blockBtnTag) {
        self.blockBtnTag(0);
    }
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
