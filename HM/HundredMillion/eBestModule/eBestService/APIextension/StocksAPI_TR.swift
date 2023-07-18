//
//  eBestTRVC.swift
//  HundredMillion
//
//  Created by youngkwanji on 2021/02/18.
//  Copyright © 2021 youngkwanji. All rights reserved.
//

import UIKit
import XingAPIMobile

//MARK: - TR Request
extension StocksAPI {
    //MARK: - CSPAQ22200 현물계좌예수금 주문가능금액 총평가2
    func requestCSPAQ22200 (){
        guard let res = apiService.initResData(resType: TR_TYPE_CD.CSPAQ22200.rawValue) else {
            LAYOUT_COMMON.showAlert(title: "ALERT", msg: TR_TYPE_CD.CSPAQ22200.rawValue + " RES NULL")
            return
        }
        
        
        RES_FIELD_DAO.setField_CSPAQ22200(res: res, acntNo: SharedDataModel.shared.acntNo, pwd: PRIVATE_KEY.ACNT_PW.rawValue)
        apiService.request_TR(type: TR_TYPE_CD.CSPAQ22200.rawValue, res: res)
    }
    
    //MARK: - t1102 주식현재가(시세)조회
    @objc func requestT1102(sender: Timer){
//    @objc func requestT1102(shcode: String){
        guard let res = apiService.initResData(resType: TR_TYPE_CD.t1102.rawValue) else {
            LAYOUT_COMMON.showAlert(title: "ALERT", msg: TR_TYPE_CD.t1102.rawValue + " RES NULL")
            return
        }
        
        if let shcode = sender.userInfo as? String {
            RES_FIELD_DAO.setField_t1102(res: res, shcode: shcode)
            apiService.request_TR(type: TR_TYPE_CD.t1102.rawValue, res: res)
        }else{
            LAYOUT_COMMON.showAlert(title: "ALERT", msg: "NOT FOUND SHCODE!!!!!")
        }

    }
    
    //MARK: - CSPAT00600 현물주문
    func requestCSPAT00600(acntNo: String, pwd: String, IsuNo: String, OrdQty: String, OrdPrc: String?, BnsTpCode: BNS_TP_CD, OrdprcPtnCode: String){
        guard let res = apiService.initResData(resType: TR_TYPE_CD.CSPAT00600.rawValue) else {
            LAYOUT_COMMON.showAlert(title: "ALERT", msg: TR_TYPE_CD.CSPAT00600.rawValue + " RES NULL")
            return
        }
        
        RES_FIELD_DAO.setField_CSPAT00600(res: res, acntNo: acntNo, pwd: pwd, IsuNo: IsuNo, OrdQty: OrdQty, OrdPrc: OrdPrc, BnsTpCode: BnsTpCode, OrdprcPtnCode: OrdprcPtnCode)
        apiService.request_TR(type: TR_TYPE_CD.CSPAT00600.rawValue, res: res)
    }
    
    //MARK: - t0424 주식잔고2
    func requestT0424(acntNo: String, pwd: String){
        guard let res = apiService.initResData(resType: TR_TYPE_CD.t0424.rawValue) else {
            LAYOUT_COMMON.showAlert(title: "ALERT", msg: TR_TYPE_CD.t0424.rawValue + " RES NULL")
            return
        }
        
        RES_FIELD_DAO.setField_t0424(res: res, acntNo: acntNo, pwd:pwd)
        apiService.request_TR(type: TR_TYPE_CD.t0424.rawValue, res: res)
    }
    
    
    
    func responseT1102(resultData: RESULT_t1102){
        apiService.start_RealTime(type: REALTIME_TYPE_CD.S3_.rawValue, shcode: resultData.shcode)
        apiService.start_RealTime(type: REALTIME_TYPE_CD.PH_.rawValue, shcode: resultData.shcode)
//        apiService.start_RealTime(type: REALTIME_TYPE_CD.SC1.rawValue, shcode: resultData.shcode)
    }
    
    
    
}
