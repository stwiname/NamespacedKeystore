//
//  MockKeyStore.h
//  NamespacedKeystore
//
//  Created by Scott Twiname on 13/08/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#ifndef MockKeyStore_h
#define MockKeyStore_h

#import <React/RCTBridgeModule.h>

@interface MockKeyStore : NSObject <RCTBridgeModule>

@property NSString* namespace;

-(id) init;
-(id) initWithNamespace:(id) namespace;

@end

#endif /* MockKeyStore_h */
