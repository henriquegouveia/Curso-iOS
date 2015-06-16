//
//  CITKeychain.m
//  Ci&T Security Framework
//
//  Created by Guilherme Andrade on 09/10/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import "CITKeychain.h"

NSString *const kCITKeychainErrorDomain     = @"com.ciandt.citkeychain";
NSString *const kCITKeychainDefaultAccount  = @"com.ciandt.citkeychain.defatulaccount";

NSString *const kCITKeychainAccountKey      = @"acct";
NSString *const kCITKeychainCreatedAtKey    = @"cdat";
NSString *const kCITKeychainClassKey        = @"labl";
NSString *const kCITKeychainDescriptionKey  = @"desc";
NSString *const kCITKeychainLabelKey        = @"labl";
NSString *const kCITKeychainLastModifiedKey = @"mdat";
NSString *const kCITKeychainWhereKey        = @"svce";

#if __IPHONE_4_0 && TARGET_OS_IPHONE  
CFTypeRef CITKeychainAccessibilityType = NULL;
#endif

@interface CITKeychain ()
+ (NSMutableDictionary *)_queryForService:(NSString *)service account:(NSString *)account;
@end

@implementation CITKeychain

#pragma mark - Getting Accounts

+ (NSArray *)allAccounts {
    
    return [self accountsForService:nil error:nil];
}

+ (NSArray *)allAccounts:(NSError **)error {
    
    return [self accountsForService:nil error:error];
}

+ (NSArray *)accountsForService:(NSString *)service {
    
    return [self accountsForService:service error:nil];
}

+ (NSArray *)accountsForService:(NSString *)service error:(NSError **)error {
    
    OSStatus status = CITKeychainErrorBadArguments;
    NSMutableDictionary *query = [self _queryForService:service account:nil];
#if __has_feature(objc_arc)
	[query setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnAttributes];
    [query setObject:(__bridge id)kSecMatchLimitAll forKey:(__bridge id)kSecMatchLimit];
#else
    [query setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnAttributes];
    [query setObject:(id)kSecMatchLimitAll forKey:(id)kSecMatchLimit];
#endif
	
	CFTypeRef result = NULL;
#if __has_feature(objc_arc)
    status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
#else
	status = SecItemCopyMatching((CFDictionaryRef)query, &result);
#endif
    if (status != noErr && error != NULL) {
		*error = [NSError errorWithDomain:kCITKeychainErrorDomain code:status userInfo:nil];
		return nil;
	}
	
#if __has_feature(objc_arc)
	return (__bridge_transfer NSArray *)result;
#else
    return [(NSArray *)result autorelease];
#endif
}


#pragma mark - Getting Passwords

+ (NSString *)passwordForService:(NSString *)service {
    
    return [self passwordForService:service account:kCITKeychainDefaultAccount error:nil];
}

+ (NSString *)passwordForService:(NSString *)service account:(NSString *)account {
    
	return [self passwordForService:service account:account error:nil];
}

+ (NSString *)passwordForService:(NSString *)service error:(NSError **)error {
    
    return [self passwordForService:service account:kCITKeychainDefaultAccount error:error];
}

+ (NSString *)passwordForService:(NSString *)service account:(NSString *)account error:(NSError **)error {
    
    NSData *data = [self passwordDataForService:service account:account error:error];
	if (data.length > 0) {
		NSString *string = [[NSString alloc] initWithData:(NSData *)data encoding:NSUTF8StringEncoding];
#if !__has_feature(objc_arc)
		[string autorelease];
#endif
		return string;
	}
	return nil;
}

+ (NSData *)passwordDataForService:(NSString *)service {
    
    return [self passwordDataForService:service account:kCITKeychainDefaultAccount error:nil];
}

+ (NSData *)passwordDataForService:(NSString *)service account:(NSString *)account {
    
    return [self passwordDataForService:service account:account error:nil];
}

+ (NSData *)passwordDataForService:(NSString *)service error:(NSError **)error {
    
    return [self passwordDataForService:service account:kCITKeychainDefaultAccount error:error];
}

+ (NSData *)passwordDataForService:(NSString *)service account:(NSString *)account error:(NSError **)error {
    
    OSStatus status = CITKeychainErrorBadArguments;
	if (!service || !account) {
		if (error) {
			*error = [NSError errorWithDomain:kCITKeychainErrorDomain code:status userInfo:nil];
		}
		return nil;
	}
	
	CFTypeRef result = NULL;	
	NSMutableDictionary *query = [self _queryForService:service account:account];
#if __has_feature(objc_arc)
	[query setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
	[query setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
	status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
#else
	[query setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
	[query setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
	status = SecItemCopyMatching((CFDictionaryRef)query, &result);
#endif
	
	if (status != noErr && error != NULL) {
		*error = [NSError errorWithDomain:kCITKeychainErrorDomain code:status userInfo:nil];
		return nil;
	}
	
#if __has_feature(objc_arc)
	return (__bridge_transfer NSData *)result;
#else
    return [(NSData *)result autorelease];
#endif
}


#pragma mark - Deleting Passwords

+ (BOOL)deletePasswordForService:(NSString *)service {
    
    return [self deletePasswordForService:service account:kCITKeychainDefaultAccount error:nil];
}

+ (BOOL)deletePasswordForService:(NSString *)service account:(NSString *)account {
    
	return [self deletePasswordForService:service account:account error:nil];
}

+ (BOOL)deletePasswordForService:(NSString *)service error:(NSError **)error {
    
    return [self deletePasswordForService:service account:kCITKeychainDefaultAccount error:error];
}

+ (BOOL)deletePasswordForService:(NSString *)service account:(NSString *)account error:(NSError **)error {
    
	OSStatus status = CITKeychainErrorBadArguments;
	if (service && account) {
		NSMutableDictionary *query = [self _queryForService:service account:account];
#if __has_feature(objc_arc)
		status = SecItemDelete((__bridge CFDictionaryRef)query);
#else
		status = SecItemDelete((CFDictionaryRef)query);
#endif
	}
	if (status != noErr && error != NULL) {
		*error = [NSError errorWithDomain:kCITKeychainErrorDomain code:status userInfo:nil];
	}
	return (status == noErr);
}


#pragma mark - Setting Passwords

+ (BOOL)setPassword:(NSString *)password forService:(NSString *)service {
    
    return [self setPassword:password forService:service account:kCITKeychainDefaultAccount error:nil];
}

+ (BOOL)setPassword:(NSString *)password forService:(NSString *)service account:(NSString *)account {
    
	return [self setPassword:password forService:service account:account error:nil];
}

+ (BOOL)setPassword:(NSString *)password forService:(NSString *)service error:(NSError **)error {
    
    return [self setPassword:password forService:service account:kCITKeychainDefaultAccount error:error];
}

+ (BOOL)setPassword:(NSString *)password forService:(NSString *)service account:(NSString *)account error:(NSError **)error {
    
    NSData *data = [password dataUsingEncoding:NSUTF8StringEncoding];
    return [self setPasswordData:data forService:service account:account error:error];
}

+ (BOOL)setPasswordData:(NSData *)password forService:(NSString *)service {
    
    return [self setPasswordData:password forService:service account:kCITKeychainDefaultAccount error:nil];
}

+ (BOOL)setPasswordData:(NSData *)password forService:(NSString *)service account:(NSString *)account {
    
    return [self setPasswordData:password forService:service account:account error:nil];
}

+ (BOOL)setPasswordData:(NSData *)password forService:(NSString *)service error:(NSError **)error {
    
    return [self setPasswordData:password forService:service account:kCITKeychainDefaultAccount error:error];
}

+ (BOOL)setPasswordData:(NSData *)password forService:(NSString *)service account:(NSString *)account error:(NSError **)error {
    
    OSStatus status = CITKeychainErrorBadArguments;
	if (password && service && account) {
        [self deletePasswordForService:service account:account];
        NSMutableDictionary *query = [self _queryForService:service account:account];
#if __has_feature(objc_arc)
		[query setObject:password forKey:(__bridge id)kSecValueData];
#else
		[query setObject:password forKey:(id)kSecValueData];
#endif
		
#if __IPHONE_4_0 && TARGET_OS_IPHONE
		if (CITKeychainAccessibilityType) {
#if __has_feature(objc_arc)
			[query setObject:(id)[self accessibilityType] forKey:(__bridge id)kSecAttrAccessible];
#else
			[query setObject:(id)[self accessibilityType] forKey:(id)kSecAttrAccessible];
#endif
		}
#endif
		
#if __has_feature(objc_arc)
        status = SecItemAdd((__bridge CFDictionaryRef)query, NULL);
#else
		status = SecItemAdd((CFDictionaryRef)query, NULL);
#endif
	}
	if (status != noErr && error != NULL) {
		*error = [NSError errorWithDomain:kCITKeychainErrorDomain code:status userInfo:nil];
	}
	return (status == noErr);
}


#pragma mark - Configuration

#if __IPHONE_4_0 && TARGET_OS_IPHONE
+ (CFTypeRef)accessibilityType {
    
	return CITKeychainAccessibilityType;
}

+ (void)setAccessibilityType:(CFTypeRef)accessibilityType {
	CFRetain(accessibilityType);
	if (CITKeychainAccessibilityType) {
		CFRelease(CITKeychainAccessibilityType);
	}
	CITKeychainAccessibilityType = accessibilityType;
}
#endif


#pragma mark - Private

+ (NSMutableDictionary *)_queryForService:(NSString *)service account:(NSString *)account {
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithCapacity:3];
#if __has_feature(objc_arc)
    [dictionary setObject:(__bridge id)kSecClassGenericPassword forKey:(__bridge id)kSecClass];
#else
	[dictionary setObject:(id)kSecClassGenericPassword forKey:(id)kSecClass];
#endif
	
    if (service) {
#if __has_feature(objc_arc)
		[dictionary setObject:service forKey:(__bridge id)kSecAttrService];
#else
		[dictionary setObject:service forKey:(id)kSecAttrService];
#endif
	}
	
    if (account) {
#if __has_feature(objc_arc)
		[dictionary setObject:account forKey:(__bridge id)kSecAttrAccount];
#else
		[dictionary setObject:account forKey:(id)kSecAttrAccount];
#endif
	}
	
    return dictionary;
}

@end
