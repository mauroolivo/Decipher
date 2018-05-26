//
//  ViewController.m
//  Decipher
//
//  Created by Mauro Olivo on 23/05/18.
//  Copyright © 2018 Mauro Olivo. All rights reserved.
//

#import "ViewController.h"
#import "NSData+DES.h"
#import "NSData+HexString.h"
#import "NSString+HexData.h"

@interface ViewController ()

@end

@implementation ViewController

//http://des.online-domain-tools.com/

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *keyStringHEX = @"1CC7A524EDABB724";
    
    //goodbye!
    NSString *decryptedStringHEX = @"676f6f6462796521";
    
    
    NSData *decryptedDataHEX = [decryptedStringHEX dataFromHexString];
    NSData *keyDataHEX       = [keyStringHEX dataFromHexString];
    
    NSData *encryptedDataResult = [decryptedDataHEX DESEncryptWithKey:keyDataHEX];
    
    NSLog(@"---------- ENCRIPTION RESULT AS HEX STRING ----------");
    NSLog(@"%@", [encryptedDataResult hexString]);
    NSLog(@"-----------------------------------------------------");
    
    
    NSString *encryptedStringHEX = @"80e07dcf4c6d4d2d";
    
    NSData *encryptedDataHEX = [encryptedStringHEX dataFromHexString];
    
    NSData *descryptedDataResult = [encryptedDataHEX DESDecryptWithKey:keyDataHEX];
    
    NSLog(@"---------- DECRIPTION RESULT AS HEX STRING ----------");
    NSLog(@"%@", [descryptedDataResult hexString]);
    NSLog(@"-----------------------------------------------------");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
