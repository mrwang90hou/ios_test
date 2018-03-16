//
//  AppDelegate.m
//  git_test02
//
//  Created by 王宁 on 2018/2/24.
//  Copyright © 2018年 mrwang90hou. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "PushWebViewController.h"

@interface AppDelegate ()<UIAlertViewDelegate>



@property (nonatomic, strong) NSDictionary *userInfo;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1.创建UIWindow对象窗口，并将UIWindows初始化为与屏幕相同大小
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    // 2.设置窗口的根控制器
    
    ViewController *ViewControler = [[ViewController alloc]init];

//    UIViewController *ViewControler = [[UIViewController alloc]init];
    self.window.rootViewController = ViewControler;
    // 3.显示窗口
    [self.window makeKeyAndVisible];
    //4.设置UIWindows背景色
    self.window.backgroundColor = [UIColor whiteColor];
    
//#pragma mark - 第二次加载方式
//    //1、创建窗口
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    // Override point for customization after application launch.
//    //2、设置窗口的根控制器
//    UINavigationController *navC = [[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]];
//    self.window.rootViewController = navC;
//    //3、显示窗口
//    self.window.backgroundColor = [UIColor yellowColor];
//    [self.window makeKeyAndVisible];
//
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




#pragma mark -SlideTabViewController

//获取DeviceToken成功
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    
    
    NSLog(@"DeviceToken: {%@}",deviceToken);
    //这里进行的操作，是将Device Token发送到服务端
    
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:nil message:[NSString stringWithFormat:@"DeviceToken:%@",deviceToken] delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}

//注册消息推送失败
- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"Register Remote Notifications error:{%@}",error);
    //    NSLog(@"Register Remote Notifications error:{%@}",error.localizedDescription);
}

//处理收到的消息推送
- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSLog(@"Receive remote notification : %@",userInfo);
    self.userInfo = userInfo;
    
    
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"通知" message:@"通知" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"查看", nil];
    [alter show];
    
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        //跳转到WebView
        UINavigationController *webViewControllerNav = [[UIStoryboard storyboardWithName:@"SlideView" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"PushWebViewControllerNav"];
        
        PushWebViewController *webViewController = webViewControllerNav.viewControllers[0];
        webViewController.url = _userInfo[@"aps"][@"alert"];
        
        [self.window.rootViewController presentViewController:webViewControllerNav animated:YES completion:^{
            
        }];
    }
}














@end
