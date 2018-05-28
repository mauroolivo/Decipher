# Decipher

DES encryption and decryption in Objective-C

## Getting Started

Working on an iOT application I had the need to decrypt the communication received from a bluetooth sensor.  No library on google was doing the correct job. The string to be decrypted and the key used for the decription were HEX strings. A wrote a few accessory methods to encode and decode the srtings.

### Prerequisites

The project is writte in Objective-C.


### Installing

The core code in for semplicity writte in viewDidLoad of ViewController.m . Accessory classes need to be linked,.

Than, for encryption, simply call:

```
NSData *encryptedDataResult = [decryptedDataHEX DESEncryptWithKey:keyDataHEX];
```

For decryption;

```
NSData *descryptedDataResult = [encryptedDataHEX DESDecryptWithKey:keyDataHEX];
```

