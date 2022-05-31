#import "StackedListPlugin.h"
#if __has_include(<stacked_list/stacked_list-Swift.h>)
#import <stacked_list/stacked_list-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "stacked_list-Swift.h"
#endif

@implementation StackedListPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftStackedListPlugin registerWithRegistrar:registrar];
}
@end
