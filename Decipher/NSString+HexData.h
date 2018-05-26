//
//  NSString+HexData.h
//  Decipher
//
//  Created by Mauro Olivo on 23/05/18.
//  Copyright © 2018 Mauro Olivo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HexData)

- (NSData *)dataFromHexString;

@end
