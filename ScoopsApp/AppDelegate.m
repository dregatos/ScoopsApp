//
//  AppDelegate.m
//  ScoopsApp
//
//  Created by David Regatos on 26/04/15.
//  Copyright (c) 2015 DRG. All rights reserved.
//

#import "AppDelegate.h"
#import "DRGAzureManager.h"
#import "DRGScoop.h"
#import "DRGThemeManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[DRGAzureManager sharedInstance] loadUserAuthInfo];
    
    if ([DRGAzureManager sharedInstance].client.currentUser) {
        // If user is already logged, then skip the login portal
        UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        UINavigationController *navController = (UINavigationController *)[mainStoryboard instantiateInitialViewController];
        self.window.rootViewController = navController;
    }
    
    [self customiseAppeareance];
    
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

#pragma mark - Appearance

- (void)customiseAppeareance {
    
    // Window
    self.window.backgroundColor = [UIColor clearColor];
    
    // UINavigationBar ***
    [[UINavigationBar appearance] setBarTintColor:[DRGThemeManager colorOfType:ThemeColorType_DarkGreen]];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName,
                                                           [DRGThemeManager defaultFontType:ThemeFontType_Logo withSize:22], NSFontAttributeName,
                                                           nil]];
    [[UINavigationBar appearance] setTintColor:[DRGThemeManager colorOfType:ThemeColorType_LightGreen]];
}


@end
