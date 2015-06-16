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

#import "NSString+Additions.h"

@implementation NSString (Additions)

- (NSString *)stringBetweenString:(NSString *)start andString:(NSString *)end {
	    
    NSRange startRange = [self rangeOfString:start];
    
    if (startRange.location != NSNotFound) {
    	
        NSRange targetRange;
        targetRange.location = startRange.location + startRange.length;
        targetRange.length = [self length] - targetRange.location;
                
        NSRange endRange = [self rangeOfString:end options:0 range:targetRange];
        
        if (endRange.location != NSNotFound) {
        	
            targetRange.length = endRange.location - targetRange.location;
            return [self substringWithRange:targetRange];
        }
    }
    return nil;
}

- (BOOL)isValidEmail {
    
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isNullOrEmpty {
    
    if (self == nil) {
        return YES;
    }
    
    if (self == (id)[NSNull null]) {
        
        return YES;
    }
    
    if ([self isEqualToString:@"(null)"]) {
        
        return YES;
    }
    
    NSString * trimmedSelf = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([trimmedSelf length] == 0) {
        
        return YES;
    }
    
    return NO;
}

- (NSString *)trim {
    
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSString*)MD5Hash:(NSString*)string
{
    return [NSData MD5Hash:[string dataUsingEncoding:NSStringEncodingConversionAllowLossy]];
}

- (NSString*)MD5Hash
{    
    return [NSData MD5Hash:(NSData *)[self dataUsingEncoding:NSStringEncodingConversionAllowLossy]];
}

- (NSString*)ASCIIString
{
    NSData *stringAsciiData = [self dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *asciiString =  [[NSString alloc] initWithData:stringAsciiData encoding:NSUTF8StringEncoding];
    return asciiString;
}

+ (NSString*)ASCIIString:(NSString *)string
{
    return [string ASCIIString];
}

@end
