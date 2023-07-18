//
//  InfoViewController.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/13.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation
import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var lblIsConnected: UILabel!
    @IBOutlet weak var lblIsLogin: UILabel!
    @IBOutlet weak var lblSvType: UILabel!
    @IBOutlet weak var lblAutoConnect: UILabel!
    
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.parent?.title = "Connection"
        getConnectionInfo()
    }
    
    
    //MARK: - Functions
    func getConnectionInfo(){
//        let isConnected = eBESTAPI.isConnected() ? "Connected" : "DisConnected"
//        print(eBESTAPI.isLogin())
//        let isLogin = eBESTAPI.isLogin() ? "YES" : "NO"
//        let autoConnect = eBESTAPI.getAutoConnect() ? "YES" : "NO"
//        let svType = eBESTAPI.getConnectServerType()
//        var svTypeStr = ""
//        if svType == .API_SERVER {
//            svTypeStr = "REAL"
//        }else{
//            svTypeStr = "MOTU"
//        }
        
//        lblIsConnected.text = "isConnected : " + isConnected
//        lblIsLogin.text = "isLogin : " + isLogin
//        lblSvType.text = "ConnectServerType : " + svTypeStr
//        lblAutoConnect.text = "AutoConnect : " + autoConnect
    }
    
}
