//
//  AppDelegate.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/13.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import UIKit
import XingAPIMobile
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let UD = UserDefaults.standard
    var pwd : String = PRIVATE_KEY.ACNT_PW.rawValue
    
    var googleAPIService : GoogleAPIService?
    
    static func shared() -> AppDelegate?{
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let me = delegate{
            return me
        }
        return nil
    }
    
    func setGoogleOAuth(){
        googleAPIService = GoogleAPIService.init()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UD.set(PRIVATE_KEY.CERT_PIN.rawValue, forKey: USER_DEFAULT_CD.CERT_PIN)
//        UD.set(isMOTU, forKey: USER_DEFAULT_CD.AUTO_LOGIN)
        
        // SET REALM DB
//        RealmConfig.setDefaultRealmForUser(username: "HM")
        
        // SET NOTIFICATION
        SchedulerService.init().initSchedule()
            
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Xing Close
        XingAPI.getInstance().close()
    }
    
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    //Google Auth WebPage
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance()?.handle(url) ?? true
    }
}

//
//
////MARK: - XingReceive
//extension AppDelegate : XingAPIDelegate{
//    func onReceiveData(_ data: ReceiveData!) {
//        print("AD-onReceiveData")
//    }
//
//    func onReleaseData(_ rqID: Int, code: String!) {
//        print("AD-onReleaseData")
//    }
//
//    func onTimeOut(_ rqID: Int, code: String!) {
//        print("AD-onTimeOut")
//    }
//
//    func onReceiveRealData(_ bcCode: String!, key: String!, data: Data!) {
//        print("AD-onReceiveRealData")
//    }
//
//    func onRetryConnnect(_ count: Int) {
//        print("AD-onRetryConnnect " + String(count))
//    }
//
//    func onDisconnect() {
//        print("AD-onDisconnect")
//    }
//
//    func onReceiveMessage(_ msg: ReceiveMessage!) {
//        print("AD-onReceiveMessage " + msg.message)
//    }
//
//    func onReceiveError(_ msg: ReceiveMessage!) {
//        print("AD-onReceiveError " + msg.message)
//    }
//}
//
