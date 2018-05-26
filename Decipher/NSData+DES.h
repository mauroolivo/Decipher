//
//  NSData+DES.h
//  Decipher
//
//  Created by Mauro Olivo on 23/05/18.
//  Copyright © 2018 Mauro Olivo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (DES)

- (NSData *)DESEncryptWithKey:(NSData *)key;
- (NSData *)DESDecryptWithKey:(NSData *)key; 

@end
