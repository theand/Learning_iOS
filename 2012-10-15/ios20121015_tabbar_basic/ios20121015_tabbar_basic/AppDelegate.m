//
//  AppDelegate.m
//  ios20121015_tabbar_basic
//
//  Created by sdt5 on 12. 10. 15..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize data;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];

    UIViewController *vc[6];
    vc[0]= [board instantiateViewControllerWithIdentifier:@"FirstVC"];
    vc[1] = [board instantiateViewControllerWithIdentifier:@"SecondVC"];
    vc[2]= [board instantiateViewControllerWithIdentifier:@"ThirdVC"];
    vc[3]= [board instantiateViewControllerWithIdentifier:@"FourthVC"];
    vc[4]= [board instantiateViewControllerWithIdentifier:@"FifthVC"];
    vc[5]= [board instantiateViewControllerWithIdentifier:@"SixthVC"];

    NSArray *controllers = [NSArray arrayWithObjects:vc[0], vc[1], vc[2], vc[3], vc[4], vc[5], nil];
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:controllers animated:YES];
    self.window.rootViewController = tabBarController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
