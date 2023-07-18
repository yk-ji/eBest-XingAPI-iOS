//
//  ExtensionClass.swift
//  HundredMillion
//
//  Created by youngkwanji on 2021/02/02.
//  Copyright © 2021 youngkwanji. All rights reserved.
//

import Foundation
import UIKit

// MARK:- Notification names
extension Notification.Name {
    
    /// Notification when user successfully sign in using Google
    static var signInGoogleCompleted: Notification.Name {
        return .init(rawValue: #function)
    }
}


//MARK:- String
extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    
    var convertDecimalPrice: String {
        guard let intValue: Int = Int.init(self) else { return "NA"}
    
        let value: NSNumber = intValue as NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        guard let resultValue = formatter.string(from: value) else { return "NA"}
        return resultValue
    }
}

//MARK:- UIApplication
extension UIApplication {
    class func topViewController(base: UIViewController? = SceneDelegate.shared()?.window?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
