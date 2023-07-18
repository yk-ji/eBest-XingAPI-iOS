//
//  StocksAPI.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/13.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation
import XingAPIMobile

class StocksAPI : UIViewController, XingAPIDelegate {
    var eBESTAPI : XingAPI!
    var apiHandler : Int = -1
    var apiService : eBestApiService!
    let UD = UserDefaults.standard

    
    static let shared = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "StocksAPI") as! StocksAPI
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initAPI(){
        XingAPI.getInstance().initAPI()
        XingAPI.getInstance().setNetworkDelegate(self)
        
        print(String.init(describing: self.classForCoder) + " XingParent")
        eBESTAPI = XingAPI.getInstance()
        apiHandler = eBESTAPI.initView(self, name: String.init(describing: self.classForCoder))
        if apiHandler < 0 {
            LAYOUT_COMMON.showAlert(title: "ALERT", msg: "API INIT FAIL")
            return
        }
        apiService = eBestApiService.init(eBESTAPI: eBESTAPI, apiHandler: apiHandler)
    }
    
    //MARK: - Functions
    func login(serverType: SERVER_TYPE){
        let loginData = LOGIN_DATA.init(apiHandler, connect_server: serverType)
        loginData.showLoginView = false
        
        if serverType == .MOTU_SERVER {
            loginData.motuUserId = PRIVATE_KEY.MOTU_ID.rawValue
            loginData.motuUserPwd = PRIVATE_KEY.MOTU_PW.rawValue
        }else if serverType == .API_SERVER {
            if eBESTAPI.getSignList().count > 0
               , let certPin = UD.string(forKey: USER_DEFAULT_CD.CERT_PIN)
               , certPin != ""{
                loginData.pubCertIdx = 0
                loginData.pubCertPwd = certPin
            }else{
                loginData.showLoginView = true
            }
        }else{ return }
        
        if let topVC = UIApplication.topViewController(){
            self.eBESTAPI.login(topVC, loginData: loginData)
        }else{
            self.eBESTAPI.login(self, loginData: loginData)
        }
    }
}

//MARK: - XingReceive
extension StocksAPI {
    //로그인 시도 응답
    func onLoginResult(_ result: LOGIN_MSG!) {
        SharedDataModel.shared.loginMsg = result.rsltMsg.msg

        if result.result && result.rsltMsg.msg == "로그인 성공"{
            if let account = StocksAPI.shared.eBESTAPI.getAccountList().first{
                SharedDataModel.shared.acntNo = account.acntNo
                SharedDataModel.shared.isLogin = true
                AppDelegate.shared()?.setGoogleOAuth()
            }else{
//                LAYOUT_COMMON.showAlert(title: "LOGIN FAIL", msg: "NOT FOUNT ACCOUNT")
            }
        }else if result.result == false{
            SharedDataModel.shared.isLogin = false
//            LAYOUT_COMMON.showAlert(title: "LOGIN FAIL", msg: result.rsltMsg.msg)
        }
    }
    
    func onReceiveData(_ data: ReceiveData!) {
        if let result = apiService.response_TR(data: data){
            switch result.trCd {
            case TR_TYPE_CD.CSPAQ22200.rawValue:
                if let data = result as? RESULT_CSPAQ22200 {
                    SharedDataModel.shared.CSPAQ22200 = data
                }else{
                    LAYOUT_COMMON.showAlert(title: "ALERT", msg: TR_TYPE_CD.CSPAQ22200.rawValue + " DATA PARSE FAIL")
                }
                break
            case TR_TYPE_CD.t1102.rawValue:
                if let data = result as? RESULT_t1102 {
                    SharedDataModel.shared.t1102 = data
                    //                    responseT1102(resultData: nowPriceData)
                }else{
                    LAYOUT_COMMON.showAlert(title: "ALERT", msg: TR_TYPE_CD.t1102.rawValue + " DATA PARSE FAIL")
                    
                }
                break
            case TR_TYPE_CD.t0424.rawValue:
                if let data = result as? RESULT_t0424_LIST {
                    SharedDataModel.shared.t0424_LIST = data
                }else{
                    LAYOUT_COMMON.showAlert(title: "ALERT", msg: TR_TYPE_CD.t0424.rawValue + " DATA PARSE FAIL")
                    
                }
                break
            default:
                break
            }
            
        }
        print("XingVC-onReceiveData")
        //        if let result = apiService.response_TR(data: data){
        //            switch result.trCd {
        //            case TR_TYPE_CD.t1102.rawValue:
        //                if let nowPriceData = result as? RESULT_t1102 {
        //                    responseT1102(resultData: nowPriceData)
        //                }else{
        //                    LAYOUT_COMMON.showAlert(title: "ALERT", msg: TR_TYPE_CD.t1102.rawValue + " DATA PARSE FAIL")
        //
        //                }
        //                break
        //            case TR_TYPE_CD.t0424.rawValue:
        //                if let tmpHoldingList = result as? RESULT_t0424_LIST {
        //
        //                    for i in tmpHoldingList.t0424List {
        //
        //                    }
        //
        //                    holdingList = tmpHoldingList
        //                    tvHodings.reloadData()
        //                }else{
        //                    LAYOUT_COMMON.showAlert(title: "ALERT", msg: TR_TYPE_CD.t0424.rawValue + " DATA PARSE FAIL")
        //
        //                }
        //                break
        //            default:
        //                break
        //            }
        //        }
        
    }
    func onReleaseData(_ rqID: Int, code: String!) {
        print("XingVC-onReleaseData")
    }
    
    func onTimeOut(_ rqID: Int, code: String!) {
        print("XingVC-onTimeOut")
    }
    
    func onReceiveRealData(_ bcCode: String!, key: String!, data: Data!) {
        print("XingVC-onReceiveRealData")
        if let result = apiService.result_RealTime(type: bcCode, shcode: key, data: data){
                    switch result.bcCd {
                    case REALTIME_TYPE_CD.S3_.rawValue:
                        if let s3Info = result as? RESULT_S3_ {
        //                    print(programInfo)
        //                    RealtimeAnalysis.shared.setRealTimeResult(data: programInfo)
        //                    setAnalysisInfo(resultData: programInfo)
//                            RealmService.shared().insertS3_(result: s3Info)
        
                        }else{
                            LAYOUT_COMMON.showAlert(title: "ALERT", msg: REALTIME_TYPE_CD.S3_.rawValue + " DATA PARSE FAIL")
                        }
                        break
        
                    case REALTIME_TYPE_CD.PH_.rawValue:
                        if let programInfo = result as? RESULT_PH_ {
                            print(programInfo)
                            RealtimeAnalysis.shared.setRealTimeResult(data: programInfo)
        //                    setAnalysisInfo(resultData: programInfo)
//                            RealmService.shared().insertPH_(result: programInfo)
                        }else{
                            LAYOUT_COMMON.showAlert(title: "ALERT", msg: REALTIME_TYPE_CD.PH_.rawValue + " DATA PARSE FAIL")
                        }
                        break
        
                    case REALTIME_TYPE_CD.SC1.rawValue:
                        if let historyInfo = result as? RESULT_SC1 {
                            RealtimeAnalysis.shared.setRealTimeResult(data: historyInfo)
                            print(historyInfo)
        //                    setAnalysisInfo(resultData: programInfo)
                        }else{
                            LAYOUT_COMMON.showAlert(title: "ALERT", msg: REALTIME_TYPE_CD.SC1.rawValue + " DATA PARSE FAIL")
                        }
                    case REALTIME_TYPE_CD.H1.rawValue:
                        if let remInfo = result as? RESULT_H1 {
                            RealtimeAnalysis.shared.setRealTimeResult(data: remInfo)
                            print(remInfo)
        //                    setAnalysisInfo(resultData: programInfo)
                        }else{
                            LAYOUT_COMMON.showAlert(title: "ALERT", msg: REALTIME_TYPE_CD.H1.rawValue + " DATA PARSE FAIL")
                        }
                        break
                    default:
                        break
                    }
                }
    }
    
    func onRetryConnnect(_ count: Int) {
        print("XingVC-onRetryConnnect " + String(count))
    }
    
    func onDisconnect() {
        print("XingVC-onDisconnect")
    }
    
    func onReceiveMessage(_ msg: ReceiveMessage!) {
        print("XingVC-onReceiveMessage " + msg.message)
    }
    
    func onReceiveError(_ msg: ReceiveMessage!) {
        print("XingVC-onReceiveError " + msg.message)
    }
}

