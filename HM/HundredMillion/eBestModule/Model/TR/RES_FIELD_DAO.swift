//
//  RES_FIELD_MODEL.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/13.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation
import XingAPIMobile

extension RES_FIELD_DAO {
    static func getResultData(type: String, res: RES) -> RES_RESULT_MODEL?{
        switch type {
        case TR_TYPE_CD.CSPAQ22200.rawValue:
            return RES_FIELD_DAO.getResultData_CSPAQ22200(type: type, res: res)
        case TR_TYPE_CD.CSPAT00600.rawValue:
            return RES_FIELD_DAO.getResultData_CSPAT00600(type: type, res: res)
        case TR_TYPE_CD.t1102.rawValue:
            return RES_FIELD_DAO.getResultData_t1102(type: type, res: res)
        case TR_TYPE_CD.t0424.rawValue:
            return RES_FIELD_DAO.getResultData_t0424(type: type, res: res)
        default:
            LAYOUT_COMMON.showAlert(title: "ALERT", msg: "NOT FOUND TRADE_CODE : " + type)
        }
        return nil
    }
}

class RES_FIELD_DAO {
    //MARK: - CSPAQ22200 현물계좌예수금 주문가능금액 총평가2
    static func setField_CSPAQ22200(res: RES, acntNo: String, pwd: String){
        let blockName = "CSPAQ22200InBlock1"
        res.clearData()
        res.setFieldData(blockName, fieldName: "RecCnt", occursIndex: 0, data: "00001")
        res.setFieldData(blockName, fieldName: "AcntNo", occursIndex: 0, data: acntNo)
        res.setFieldData(blockName, fieldName: "Pwd", occursIndex: 0, data: pwd)
        res.setFieldData(blockName, fieldName: "BalCreTp", occursIndex: 0, data: "0")
        res.setFieldData(blockName, fieldName: "MgmtBrnNo", occursIndex: 0, data: " ")
    }
    
    private static func getResultData_CSPAQ22200(type: String, res: RES) -> RES_RESULT_MODEL{
        let blockName = "CSPAQ22200OutBlock2"
        let MnyOrdAbleAmt = res.getFieldData(blockName, fieldName: "MnyOrdAbleAmt", occursIndex: 0)
        let SeOrdAbleAmt = res.getFieldData(blockName, fieldName: "SeOrdAbleAmt", occursIndex: 0)
        let Dps = res.getFieldData(blockName, fieldName: "Dps", occursIndex: 0)
        let PrdaySellAdjstAmt = res.getFieldData(blockName, fieldName: "PrdaySellAdjstAmt", occursIndex: 0)
        let PrdayBuyAdjstAmt = res.getFieldData(blockName, fieldName: "PrdayBuyAdjstAmt", occursIndex: 0)
        let CrdaySellAdjstAmt = res.getFieldData(blockName, fieldName: "CrdaySellAdjstAmt", occursIndex: 0)
        let CrdayBuyAdjstAmt = res.getFieldData(blockName, fieldName: "CrdayBuyAdjstAmt", occursIndex: 0)
        
        let result = RESULT_CSPAQ22200.init(trCd: type,
                                            MnyOrdAbleAmt: MnyOrdAbleAmt,
                                            SeOrdAbleAmt: SeOrdAbleAmt,
                                            Dps: Dps,
                                            PrdaySellAdjstAmt: PrdaySellAdjstAmt,
                                            PrdayBuyAdjstAmt: PrdayBuyAdjstAmt,
                                            CrdaySellAdjstAmt: CrdaySellAdjstAmt,
                                            CrdayBuyAdjstAmt: CrdayBuyAdjstAmt)
        return result
    }
    
    //MARK: - CSPAT00600 현물주문
    static func setField_CSPAT00600(res: RES, acntNo: String, pwd: String, IsuNo: String, OrdQty: String, OrdPrc: String?, BnsTpCode: BNS_TP_CD, OrdprcPtnCode : String){
        let blockName = "CSPAT00600InBlock1"
        res.clearData()
        res.setFieldData(blockName, fieldName: "AcntNo", occursIndex: 0, data: acntNo)
        res.setFieldData(blockName, fieldName: "InptPwd", occursIndex: 0, data: pwd)
        res.setFieldData(blockName, fieldName: "IsuNo", occursIndex: 0, data: IsuNo)
        res.setFieldData(blockName, fieldName: "OrdQty", occursIndex: 0, data: OrdQty)
        res.setFieldData(blockName, fieldName: "OrdPrc", occursIndex: 0, data: OrdPrc!)
        res.setFieldData(blockName, fieldName: "MgntrnCode", occursIndex: 0, data: "000")
        res.setFieldData(blockName, fieldName: "BnsTpCode", occursIndex: 0, data: BnsTpCode.rawValue)
        res.setFieldData(blockName, fieldName: "OrdprcPtnCode", occursIndex: 0, data: OrdprcPtnCode)
        res.setFieldData(blockName, fieldName: "OrdCndiTpCode", occursIndex: 0, data: "0")
    }
    
    private static func getResultData_CSPAT00600(type: String, res: RES) -> RES_RESULT_MODEL{
        let blockName = "CSPAT00600OutBlock1"
        let shcode = res.getFieldData(blockName, fieldName: "shcode", occursIndex: 0)
        let IsuNo = res.getFieldData(blockName, fieldName: "IsuNo", occursIndex: 0)
        let OrdQty = res.getFieldData(blockName, fieldName: "OrdQty", occursIndex: 0)
        let OrdPrc = res.getFieldData(blockName, fieldName: "OrdPrc", occursIndex: 0)
        let BnsTpCode = res.getFieldData(blockName, fieldName: "BnsTpCode", occursIndex: 0)
        let OrdprcPtnCode = res.getFieldData(blockName, fieldName: "OrdprcPtnCode", occursIndex: 0)
        let OrdCndiTpCode = res.getFieldData(blockName, fieldName: "OrdCndiTpCode", occursIndex: 0)
        
        let result = RESULT_CSPAT00600.init(trCd: type,
                                            shcode: shcode,
                                            IsuNo: IsuNo,
                                            OrdQty: OrdQty,
                                            OrdPrc: OrdPrc,
                                            BnsTpCode: BnsTpCode,
                                            OrdprcPtnCode: OrdprcPtnCode,
                                            OrdCndiTpCode: OrdCndiTpCode)
        return result
    }
    
    //MARK: - t1102 주식현재가(시세)조회
    static func setField_t1102(res: RES, shcode: String){
        let blockName = "t1102InBlock"
        res.clearData()
        res.setFieldData(blockName, fieldName: "shcode", occursIndex: 0, data: shcode)
    }
    
    private static func getResultData_t1102(type: String, res: RES) -> RES_RESULT_MODEL{
        let blockName = "t1102OutBlock"
        let shcode = res.getFieldData(blockName, fieldName: "shcode", occursIndex: 0)
        let price = res.getFieldData(blockName, fieldName: "price", occursIndex: 0)
        
        
        let result = RESULT_t1102.init(trCd: type, shcode: shcode, price: price)
        return result
    }
    
    //MARK: - t0424 주식잔고2
    static func setField_t0424(res: RES, acntNo: String, pwd: String){
        let blockName = "t0424InBlock"
        res.clearData()
        res.setFieldData(blockName, fieldName: "accno", occursIndex: 0, data: acntNo)
        res.setFieldData(blockName, fieldName: "passwd", occursIndex: 0, data: pwd)
        res.setFieldData(blockName, fieldName: "prcgb", occursIndex: 0, data: "1")
        res.setFieldData(blockName, fieldName: "chegb", occursIndex: 0, data: "0")
        res.setFieldData(blockName, fieldName: "dangb", occursIndex: 0, data: "0")
        res.setFieldData(blockName, fieldName: "charge", occursIndex: 0, data: "1")
        res.setFieldData(blockName, fieldName: "cts_expcode", occursIndex: 0, data: "")
        
    }
    
    private static func getResultData_t0424(type: String, res: RES) -> RES_RESULT_MODEL{
        let blockName = "t0424OutBlock1"
        let nCount = res.getOccursCount(blockName)
        var tmpList : [RESULT_t0424] = []
        
        for i in 0..<nCount {
            let shcode = res.getFieldData(blockName, fieldName: "expcode", occursIndex: i)
            let janqty = res.getFieldData(blockName, fieldName: "janqty", occursIndex: i)
            let mdposqt = res.getFieldData(blockName, fieldName: "mdposqt", occursIndex: i)
            let pamt = res.getFieldData(blockName, fieldName: "pamt", occursIndex: i)
            let mamt = res.getFieldData(blockName, fieldName: "mamt", occursIndex: i)
            let hname = res.getFieldData(blockName, fieldName: "hname", occursIndex: i)
            let janrt = res.getFieldData(blockName, fieldName: "janrt", occursIndex: i)
            let price = res.getFieldData(blockName, fieldName: "price", occursIndex: i)
            let appamt = res.getFieldData(blockName, fieldName: "appamt", occursIndex: i)
            let dtsunik = res.getFieldData(blockName, fieldName: "dtsunik", occursIndex: i)
            let sunikrt = res.getFieldData(blockName, fieldName: "sunikrt", occursIndex: i)
            let fee = res.getFieldData(blockName, fieldName: "fee", occursIndex: i)
            let tax = res.getFieldData(blockName, fieldName: "tax", occursIndex: i)
        
            let tmpResult = RESULT_t0424.init(trCd: type, shcode: shcode, janqty: janqty, mdposqt: mdposqt, pamt: pamt, mamt: mamt, hname: hname, janrt: janrt, price: price, appamt: appamt, dtsunik: dtsunik, sunikrt: sunikrt, fee: fee, tax: tax)
            tmpList.append(tmpResult)
        }
//        let jsonOutblock = res.getJsonData(blockName)
//        print(jsonOutblock)
        
        let result = RESULT_t0424_LIST.init(trCd: type, t0424List: tmpList)
        return result
    }
    
    
}

