/* 
 * Copyright (C) 2012 Ci&T Inc.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy 
 * of this software and associated documentation files (the "Software"), to deal 
 * in the  Software without restriction, including without limitation the rights 
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
 * copies of the Software, and to permit persons to whom the Software is furnished
 * to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in 
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
 * INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
 * PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

#import "UIDevice+Additions.h"
#import <sys/utsname.h>

@implementation UIDevice (Hardware)

- (NSString *)machineName {
	
    struct utsname systemInfo;
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.machine
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)platformName {
    
    NSString *sDeviceModel = [self machineName];
    
    if ([sDeviceModel isEqual:@"i386"])      return @"Simulator";       //iPhone Simulator
    
    if ([sDeviceModel isEqual:@"iPhone1,1"]) return @"iPhone 1G";       //iPhone 1G
    if ([sDeviceModel isEqual:@"iPhone1,2"]) return @"iPhone 3G";       //iPhone 3G
    if ([sDeviceModel isEqual:@"iPhone2,1"]) return @"iPhone 3GS";      //iPhone 3GS
    if ([sDeviceModel isEqual:@"iPhone3,1"]) return @"iPhone 4";        //iPhone 4 - AT&T
    if ([sDeviceModel isEqual:@"iPhone3,2"]) return @"iPhone 4";        //iPhone 4 - Other carrier
    if ([sDeviceModel isEqual:@"iPhone3,3"]) return @"iPhone 4";        //iPhone 4 - Other carrier
    if ([sDeviceModel isEqual:@"iPhone4,1"]) return @"iPhone 4S";       //iPhone 4S
    
    if ([sDeviceModel isEqual:@"iPod1,1"])   return @"iPod 1st Gen";    //iPod Touch 1G
    if ([sDeviceModel isEqual:@"iPod2,1"])   return @"iPod 2nd Gen";    //iPod Touch 2G
    if ([sDeviceModel isEqual:@"iPod3,1"])   return @"iPod 3rd Gen";    //iPod Touch 3G
    if ([sDeviceModel isEqual:@"iPod4,1"])   return @"iPod 4th Gen";    //iPod Touch 4G
    
    if ([sDeviceModel isEqual:@"iPad1,1"])   return @"iPad 1";          //iPad 1
    if ([sDeviceModel isEqual:@"iPad1,2"])   return @"iPad 1";          //iPad 1
    
    if ([sDeviceModel isEqual:@"iPad2,1"])   return @"iPad 2";          //iPad 2
    if ([sDeviceModel isEqual:@"iPad2,2"])   return @"iPad 2";          //iPad 2
    if ([sDeviceModel isEqual:@"iPad2,3"])   return @"iPad 2";          //iPad 2

    if ([sDeviceModel isEqual:@"iPad3,1"])   return @"iPad 3";          //iPad 3
    if ([sDeviceModel isEqual:@"iPad3,2"])   return @"iPad 3";          //iPad 3
    if ([sDeviceModel isEqual:@"iPad3,3"])   return @"iPad 3";          //iPad 3
    
    else return sDeviceModel;
}

@end
