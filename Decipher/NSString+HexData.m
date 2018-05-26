//
//  NSString+HexData.m
//  Decipher
//
//  Created by Mauro Olivo on 23/05/18.
//  Copyright © 2018 Mauro Olivo. All rights reserved.
//

#import "NSString+HexData.h"

@implementation NSString (HexData)

- (NSData *)dataFromHexString {
    
    const char *chars = [self UTF8String];
    long i = 0, len = self.length;
    
    NSMutableData *data = [NSMutableData dataWithCapacity:len / 2];
    char byteChars[3] = {'\0','\0','\0'};
    unsigned long wholeByte;
    
    while (i < len) {
        byteChars[0] = chars[i++];
        byteChars[1] = chars[i++];
        wholeByte = strtoul(byteChars, NULL, 16);
        [data appendBytes:&wholeByte length:1];
    }
    
    return data;
    
}

@end
