//
//  AppDelegate.swift
//  VisionCameraExample
//
//  Created by Marc Rousavy on 05.08.21.
//

import Foundation
import UIKit

@UIApplicationMain
class AppDelegate: NSObject, UIApplicationDelegate, RCTBridgeDelegate {
    // MARK: - App Initialization

    func application(_: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        guard let bridge = RCTBridge(delegate: self, launchOptions: launchOptions) else {
            return false
        }
        ReactNativeNavigation.bootstrap(with: bridge)

        return true
    }

    // MARK: - React Native Navigation setup

    func extraModules(for bridge: RCTBridge!) -> [RCTBridgeModule]! {
        ReactNativeNavigation.extraModules(for: bridge)
    }

    // MARK: - JS Bundle loading

    func sourceURL(for _: RCTBridge!) -> URL! {
        // DEBUG must be setup in Swift projects: https://stackoverflow.com/a/24112024/4047926
        #if DEBUG
            return RCTBundleURLProvider.sharedSettings()?.jsBundleURL(forBundleRoot: "index", fallbackResource: nil)
        #else
            return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
        #endif
    }
}
