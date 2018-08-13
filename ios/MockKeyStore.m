//
//  MockKeyStore.m
//  NamespacedKeystore
//
//  Created by Scott Twiname on 13/08/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridge.h>
#import "MockKeyStore.h"

@implementation MockKeyStore

- (id) init {
   return [self initWithNamespace:nil];
}

- (id) initWithNamespace:(id) namespace {
  if (self = [super init]) {
    if (namespace == nil) {
      // TODO gen random id, possibly react instance id
      namespace = @"a369x123";
    }
    [self setNamespace:namespace];
  }
  return self;
}

//RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(getKeys:(RCTPromiseResolveBlock) resolve
                  rejecter: (RCTPromiseRejectBlock) reject) {
  
  NSMutableArray * array = [NSMutableArray array];
  for(int i = 0; i < 3; i++) {
    [array addObject:[NSString stringWithFormat:@"%@:%i", [self namespace], i]];
  }
  resolve(array);
}

+ (NSString *)moduleName {
  return @"MockKeyStore";
}

+ (BOOL)requiresMainQueueSetup {
  return YES;
}

@end
