import Flutter
import UIKit
import Beacon



public class SwiftFlutterHelpScoutPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "privilee/flutter_help_scout", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterHelpScoutPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let arguments = call.arguments as? NSDictionary
    
    if(call.method.elementsEqual("initialize")){

        // initialize beacon
        initializeBeacon(arguments: arguments!)

        result("Beacon successfully initialized")
    }
    else if(call.method.elementsEqual("openBeacon")){
     
        let beaconId = arguments!["beaconId"] as? String
        
        // open beacon
        openBeacon(beaconId: beaconId!)
      
        result("Beacon open successfully!")
    }

    else if(call.method.elementsEqual("logoutBeacon")){
     
        // logout beacon
        logoutBeacon()
      
        result("Beacon logged out successfully!")
    }

    else if(call.method.elementsEqual("clearBeacon")){
     
        // reset beacon
        resetBeacon()
      
        result("Beacon reset successfully!")
    }
    
  }
    
    
  public func initializeBeacon(arguments: NSDictionary){
        
    let email = arguments["email"] as? String
    let name = arguments["name"] as? String
        
    let user = HSBeaconUser()
    user.email = email
    user.name = name

    let attributes = arguments["attributes"] as? Dictionary<String, Any>
    if(let userAttributes = attributes) {
          for (key, value) in attributes {
              user.addAttribute(withKey: key, value: value)
          }
    }

    HSBeacon.login(user)
 }

    // open the beacon
  public func openBeacon(beaconId: String){
    let settings = HSBeaconSettings(beaconId: beaconId)
    HSBeacon.open(settings)
  }

  // logout beacon
  public func logoutBeacon(){
    HSBeacon.logout()
  }

  // reset beacon
  public func resetBeacon(){
    HSBeacon.reset()
  }
    
}
