//
//  eBestRealtimeVC.swift
//  HundredMillion
//
//  Created by youngkwanji on 2021/02/18.
//  Copyright © 2021 youngkwanji. All rights reserved.
//

import UIKit
import XingAPIMobile

//class eBestRealtimeVC: XingViewContorller {
//    //MARK: - ViewLifeCycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    
//    //MARK: - Functions
//    func showXingLoginView(){
//        let loginData = LOGIN_DATA.init(apiHandler, connect_server: .API_SERVER)
//        self.eBESTAPI.login(self, loginData: loginData)
//    }
//    
//    
//    //MARK: - IBAction
//    @IBAction func setAutoLoginFlag(_ sender: UISegmentedControl) {
//        if sender.selectedSegmentIndex == 1 {
//            UD.set(true, forKey: USER_DEFAULT_CD.AUTO_LOGIN)
//        }else{
//            UD.set(false, forKey: USER_DEFAULT_CD.AUTO_LOGIN)
//        }
//    }
//    
//    @IBAction func touchLogin(_ sender: Any) {
//        showXingLoginView()
//    }
//}
//
////MARK: - XingReceive
//extension eBestRealtimeVC {
//    override func onReceiveData(_ data: ReceiveData!) {
//    }
//    
//    override func onReleaseData(_ rqID: Int, code: String!) {
//        print("TradeViewController-onReleaseData" + String(rqID) + " " + code)
//    }
//    
//    override func onTimeOut(_ rqID: Int, code: String!) {
//        print("TradeViewController-onTimeOut")
//    }
//    
//    override func onReceiveRealData(_ bcCode: String!, key: String!, data: Data!) {
//    }
//    
//    override func onRetryConnnect(_ count: Int) {
//        print("TradeViewController-onRetryConnnect " + String(count))
//    }
//    
//    override func onDisconnect() {
//        print("TradeViewController-onDisconnect")
//    }
//    
//    override func onReceiveMessage(_ msg: ReceiveMessage!) {
//        print("TradeViewController-onReceiveMessage " + msg.message)
//        
//    }
//    
//    override func onReceiveError(_ msg: ReceiveMessage!) {
//        print("TradeViewController-onReceiveError " + msg.message)
//    }
//}
//
