//
//  SharedDataModel.swift
//  HundredMillion
//
//  Created by youngkwanji on 2021/02/18.
//  Copyright © 2021 youngkwanji. All rights reserved.
//

import Foundation
import UIKit
enum CMN_DATA_TYPE_CD : String{
    case LOGIN_MSG = "LOGIN_MSG"
}

@objc protocol SharedDataSyncProtocol : NSObjectProtocol{
    @objc func syncData(dataType : String)
}

class SharedDataModel : NSObject{
    private static var _shared = SharedDataModel()
    static var shared: SharedDataModel {
        return SharedDataModel._shared
    }
    
    static func reset() {
        SharedDataModel._shared = SharedDataModel()
    }
    
    var isLogin: Bool = false{
        didSet(oldVal){
            if isLogin {
                LAYOUT_COMMON.showMainVC()
            }else{
                LAYOUT_COMMON.showLoginVC()
                SharedDataModel.reset()
            }
        }
    }
    
    var loginMsg: String = "-"{
        didSet(oldVal){
            updateLayout(dataType: CMN_DATA_TYPE_CD.LOGIN_MSG.rawValue)
        }
    }
    
    var acntNo: String = "-"{
        didSet(oldVal){
         
        }
    }
    
    var CSPAQ22200 : RESULT_CSPAQ22200? {
        didSet(oldVal){
            updateLayout(dataType: TR_TYPE_CD.CSPAQ22200.rawValue)
        }
    }
    
    var CSPAT00600 : RESULT_CSPAT00600? {
        didSet(oldVal){
            updateLayout(dataType: TR_TYPE_CD.CSPAT00600.rawValue)
        }
    }
    
    var t0424_LIST : RESULT_t0424_LIST? {
        didSet(oldVal){
            updateLayout(dataType: TR_TYPE_CD.t0424.rawValue)
        }
    }
    
    var t1102 : RESULT_t1102? {
        didSet(oldVal){
            updateLayout(dataType: TR_TYPE_CD.t1102.rawValue)
        }
    }
    
    var holdingStocksList : [STOCKS_INFO]? {
        didSet(oldVal){
            
        }
    }
    
    private func updateLayout(dataType : String){
        if let vc = UIApplication.topViewController() as? SharedDataSyncProtocol{
            vc.syncData(dataType: dataType)
        }
    }
    
    
}
