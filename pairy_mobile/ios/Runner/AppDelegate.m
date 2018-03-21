#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

-(BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.launchedURL = [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey];
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    self.launchedURL = [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey];
    NSLog(@"Dict: %@", launchOptions);
    
    // Print errythang.
    for (NSString *key in [launchOptions allKeys]) {
        NSLog(@"%@ = %@", key, [launchOptions objectForKey:key]);
    }
    
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    
    FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
                                            methodChannelWithName:@"com.thosakwe.pairy/url"
                                            binaryMessenger:controller];
    
    [batteryChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        // TODO
    }];
    
  [super application:application didFinishLaunchingWithOptions:launchOptions];
    [self applicationDidBecomeActive:application];
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    if (self.launchedURL) {
        [self openLink:self.launchedURL];
        self.launchedURL = nil;
    } else {
        //NSLog(@"No launchedURL found :/");
    }
}

- (BOOL)openLink:(NSURL *)url
{
    // Find some way to pass the URL as a message.
    //NSLog(@"Hello????");
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    
    FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
                                            methodChannelWithName:@"com.thosakwe.pairy/url"
                                            binaryMessenger:controller];
    //NSLog(@"URL: %@", url.absoluteString);
    [batteryChannel invokeMethod: @"url" arguments: url.absoluteString];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(nonnull id)annotation {
    return [self openLink:url];
}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return [self application:app handleOpenURL:url];
}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [self openLink:url];
}

@end
