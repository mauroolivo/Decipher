//
//  NSData+DES.m
//  Decipher
//
//  Created by Mauro Olivo on 23/05/18.
//  Copyright © 2018 Mauro Olivo. All rights reserved.
//

#import "NSData+DES.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (DES)

- (NSData *)DESEncryptWithKey:(NSData *)key {
    
    //NSStringEncoding EnC = NSUTF8StringEncoding;
    NSMutableData * dKey = [key mutableCopy];
    [dKey setLength:kCCBlockSizeDES];
    uint8_t *bufferPtr1 = NULL;
    size_t bufferPtrSize1 = 0;
    size_t movedBytes1 = 0;
    
    bufferPtrSize1 = ([self length] + kCCKeySizeDES) & ~(kCCKeySizeDES -1);
    bufferPtr1 = malloc(bufferPtrSize1 * sizeof(uint8_t));
    memset((void *)bufferPtr1, 0x00, bufferPtrSize1);
    CCCrypt(kCCEncrypt, // CCOperation op
            kCCAlgorithmDES, // CCAlgorithm alg
            kCCOptionECBMode, // CCOptions options
            [dKey bytes], // const void *key
            [dKey length], // size_t keyLength
            NULL, // const void *iv
            [self bytes], // const void *dataIn
            [self length],  // size_t dataInLength
            (void *)bufferPtr1, // void *dataOut
            bufferPtrSize1,     // size_t dataOutAvailable
            &movedBytes1);      // size_t *dataOutMoved
    
    NSData *sResult = [NSData dataWithBytes:bufferPtr1 length:movedBytes1];
    
    return sResult;
}

- (NSData *)DESDecryptWithKey:(NSData *)key {
    
    //NSStringEncoding EnC = NSUTF8StringEncoding;
    const void *dataIn;
    size_t dataInLength;
    
    dataInLength = [self length];
    dataIn = [self bytes];
    
    NSMutableData * dKey = [key mutableCopy];
    [dKey setLength:kCCBlockSizeDES];
    uint8_t *bufferPtr1 = NULL;
    size_t bufferPtrSize1 = 0;
    size_t movedBytes1 = 0;

    bufferPtrSize1 = ([self length] + kCCKeySizeDES) & ~(kCCKeySizeDES -1);
    bufferPtr1 = malloc(bufferPtrSize1 * sizeof(uint8_t));
    memset((void *)bufferPtr1, 0x00, bufferPtrSize1);
    CCCrypt(kCCDecrypt, // CCOperation op
            kCCAlgorithmDES, // CCAlgorithm alg
            kCCOptionECBMode, // CCOptions options
            [dKey bytes], // const void *key
            [dKey length], // size_t keyLength
            NULL, // const void *iv
            dataIn, // const void *dataIn
            dataInLength,  // size_t dataInLength
            (void *)bufferPtr1, // void *dataOut
            bufferPtrSize1,     // size_t dataOutAvailable
            &movedBytes1);      // size_t *dataOutMoved
    
    return [NSData dataWithBytes:bufferPtr1
                                length:movedBytes1];
}

@end
