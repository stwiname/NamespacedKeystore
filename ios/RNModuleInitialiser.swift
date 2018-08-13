//
//  RNModuleInitialiser.swift
//  NamespacedKeystore
//
//  Created by Scott Twiname on 13/08/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

import Foundation


@objc(RNModuleInitialiser)
final class RNModuleInitialiser: NSObject {
  
  //Inject your dependencies here
  override init() {
    
  }
  
}

extension RNModuleInitialiser: RCTBridgeDelegate {
  
  func sourceURL(for bridge: RCTBridge!) -> URL! {
    return RCTBundleURLProvider.sharedSettings().jsBundleURL( forBundleRoot: "index", fallbackResource: nil)
  }
  
  func extraModules(for bridge: RCTBridge!) -> [RCTBridgeModule]! {
    
    var extraModules = [RCTBridgeModule]()
    
    //Initialise the modules here using the dependencies injected above
    let mockKeyStore = MockKeyStore(namespace: "ExampleNamespace")
    
    extraModules.append(mockKeyStore!)
    
    return extraModules
  }
  
}
