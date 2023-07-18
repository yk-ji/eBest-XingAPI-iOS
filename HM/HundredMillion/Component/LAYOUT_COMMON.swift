//
//  LayoutCommon.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/13.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation
import UIKit

class LAYOUT_COMMON {
    static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    static func showLoginVC() {
        guard let loginVC = storyboard.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else {
            print("LoginViewController not found")
            return
        }
        
        SceneDelegate.shared()?.window?.rootViewController = loginVC
    }
    
    static func showMainVC() {
        if let _ = SceneDelegate.shared()?.window?.rootViewController as? UINavigationController {
            return
        }else{
            guard let mainVC = storyboard.instantiateViewController(identifier: "MainViewController") as? MainViewController else {
                print("MainViewController not found")
                return
            }
            
            guard let tradeVC = storyboard.instantiateViewController(identifier: "TradeViewController") as? TradeViewController else {
                print("TradeViewController not found")
                return
            }
            
            guard let analysisVC = storyboard.instantiateViewController(identifier: "AnalysisViewController") as? AnalysisViewController else {
                print("AnalysisViewController not found")
                return
            }
            
            guard let stocksMngVC = storyboard.instantiateViewController(identifier: "StocksManageViewController") as? StocksManageViewController else {
                print("StocksManageViewController not found")
                return
            }
            
            guard let infoVC = storyboard.instantiateViewController(identifier: "InfoViewController") as? InfoViewController else {
                print("InfoViewController not found")
                return
            }
            
            mainVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
            tradeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
            stocksMngVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
            analysisVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 3)
            infoVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 4)
            
            let tabVC = UITabBarController.init()
            tabVC.viewControllers = [mainVC, tradeVC, stocksMngVC, analysisVC , infoVC]
            let naviVC = UINavigationController.init(rootViewController: tabVC)
            
            // SET THEME
//            naviVC.navigationBar.barTintColor = UIColor.init(hex: HEX_COLOR_KEY.NAVI_VIEW.rawValue)
//            naviVC.navigationBar.tintColor = UIColor.init(hex: HEX_COLOR_KEY.RED_VIEW.rawValue)
//            naviVC.navigationBar.isTranslucent = false
            naviVC.navigationBar.isHidden = true
            tabVC.tabBar.barTintColor = UIColor.init(hex: HEX_COLOR_KEY.NAVI_VIEW.rawValue)
            tabVC.tabBar.tintColor = UIColor.init(hex: HEX_COLOR_KEY.RED_VIEW.rawValue)
            tabVC.tabBar.unselectedItemTintColor = UIColor.init(hex: HEX_COLOR_KEY.WHITE_TEXT.rawValue)
            tabVC.tabBar.isTranslucent = false
            
            
            SceneDelegate.shared()?.window?.rootViewController = naviVC
        }
    }
    
    static func showAlert(title: String, msg: String) {
        let alertVC = UIAlertController.init(title: title, message: msg, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction.init(title: "cancel", style: .cancel, handler: nil))
        //        if let naviVC = SceneDelegate.shared()?.window?.rootViewController as? UINavigationController{
        //            naviVC.pushViewController(alertVC, animated: true)
        //        }else if let VC = SceneDelegate.shared()?.window?.rootViewController{
        //            VC.present(alertVC, animated: true, completion: nil)
        //        }
        if let VC = SceneDelegate.shared()?.window?.rootViewController{
            VC.present(alertVC, animated: true, completion: nil)
        }
    }
    
}
