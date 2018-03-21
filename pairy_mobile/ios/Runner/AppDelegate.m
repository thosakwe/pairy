#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    for (NSString *key in launchOptions) {
        NSLog(@"%@", launchOptions[key]);
    }
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
