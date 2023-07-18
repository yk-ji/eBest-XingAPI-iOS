//
//  REALTIME_FIELD_DAO.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/13.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation
import XingAPIMobile

extension REALTIME_FIELD_DAO {
    static func getResultData(type: String, res: RES) -> REALTIME_RESULT_MODEL?{
        switch type {
        case REALTIME_TYPE_CD.S3_.rawValue:
            return REALTIME_FIELD_DAO.getResultData_S3_(type: type, res: res)
        case REALTIME_TYPE_CD.PH_.rawValue:
            return REALTIME_FIELD_DAO.getResultData_PH_(type: type, res: res)
        case REALTIME_TYPE_CD.SC1.rawValue:
            return REALTIME_FIELD_DAO.getResultData_SC1(type: type, res: res)
        case REALTIME_TYPE_CD.H1.rawValue:
            return REALTIME_FIELD_DAO.getResultData_H1(type: type, res: res)
        default:
            LAYOUT_COMMON.showAlert(title: "ALERT", msg: "NOT FOUND BC_CODE : " + type)
        }
        return nil
    }
}


class REALTIME_FIELD_DAO {
    //MARK: - S3_ KOSPI체결
    private static func getResultData_S3_(type: String, res: RES) -> REALTIME_RESULT_MODEL{
        let blockName = "OutBlock"
        let shcode = res.getFieldData(blockName, fieldName: "shcode", occursIndex: 0)
        let chetime = res.getFieldData(blockName, fieldName: "chetime", occursIndex: 0)
        let sign = res.getFieldData(blockName, fieldName: "sign", occursIndex: 0)
        let change = res.getFieldData(blockName, fieldName: "change", occursIndex: 0)
        let drate = res.getFieldData(blockName, fieldName: "drate", occursIndex: 0)
        let price = res.getFieldData(blockName, fieldName: "price", occursIndex: 0)
        let opentime = res.getFieldData(blockName, fieldName: "opentime", occursIndex: 0)
        let open = res.getFieldData(blockName, fieldName: "open", occursIndex: 0)
        let hightime = res.getFieldData(blockName, fieldName: "hightime", occursIndex: 0)
        let high = res.getFieldData(blockName, fieldName: "high", occursIndex: 0)
        let lowtime = res.getFieldData(blockName, fieldName: "lowtime", occursIndex: 0)
        let low = res.getFieldData(blockName, fieldName: "low", occursIndex: 0)
        let cgubun = res.getFieldData(blockName, fieldName: "cgubun", occursIndex: 0)
        let cvolume = res.getFieldData(blockName, fieldName: "cvolume", occursIndex: 0)
        let volume = res.getFieldData(blockName, fieldName: "volume", occursIndex: 0)
        let value = res.getFieldData(blockName, fieldName: "value", occursIndex: 0)
        let mdvolume = res.getFieldData(blockName, fieldName: "mdvolume", occursIndex: 0)
        let mdchecnt = res.getFieldData(blockName, fieldName: "mdchecnt", occursIndex: 0)
        let msvolume = res.getFieldData(blockName, fieldName: "msvolume", occursIndex: 0)
        let mschecnt = res.getFieldData(blockName, fieldName: "mschecnt", occursIndex: 0)
        let cpower = res.getFieldData(blockName, fieldName: "cpower", occursIndex: 0)
        let w_avrg = res.getFieldData(blockName, fieldName: "w_avrg", occursIndex: 0)
        let offerho = res.getFieldData(blockName, fieldName: "offerho", occursIndex: 0)
        let bidho = res.getFieldData(blockName, fieldName: "bidho", occursIndex: 0)
        let status = res.getFieldData(blockName, fieldName: "status", occursIndex: 0)
        let jnilvolume = res.getFieldData(blockName, fieldName: "jnilvolume", occursIndex: 0)
        
        
        let result = RESULT_S3_.init(bcCd: type, shcode: shcode, chetime: chetime, sign: sign,
                                     change: change, drate: drate, price: price,
                                     opentime: opentime, open: open, hightime: hightime,
                                     high: high, lowtime: lowtime, low: low, cgubun: cgubun,
                                     cvolume: cvolume, volume: volume, value: value,
                                     mdvolume: mdvolume, mdchecnt: mdchecnt, msvolume: msvolume,
                                     mschecnt: mschecnt, cpower: cpower, w_avrg: w_avrg,
                                     offerho: offerho, bidho: bidho, status: status,
                                     jnilvolume: jnilvolume)
        
        
        return result
    }
    
    //MARK: - PH_ KOSPI프로그램매매종목별(PH)
    private static func getResultData_PH_(type: String, res: RES) -> REALTIME_RESULT_MODEL{
        let blockName = "OutBlock"
        let shcode = res.getFieldData(blockName, fieldName: "shcode", occursIndex: 0)
        let time = res.getFieldData(blockName, fieldName: "time", occursIndex: 0)
        let price = res.getFieldData(blockName, fieldName: "price", occursIndex: 0)
        let sign = res.getFieldData(blockName, fieldName: "sign", occursIndex: 0)
        let change = res.getFieldData(blockName, fieldName: "change", occursIndex: 0)
        let volume = res.getFieldData(blockName, fieldName: "volume", occursIndex: 0)
        let drate = res.getFieldData(blockName, fieldName: "drate", occursIndex: 0)
        let cdhrem = res.getFieldData(blockName, fieldName: "cdhrem", occursIndex: 0)
        let cshrem = res.getFieldData(blockName, fieldName: "cshrem", occursIndex: 0)
        let bdhrem = res.getFieldData(blockName, fieldName: "bdhrem", occursIndex: 0)
        let bshrem = res.getFieldData(blockName, fieldName: "bshrem", occursIndex: 0)
        let cdhvolume = res.getFieldData(blockName, fieldName: "cdhvolume", occursIndex: 0)
        let cshvolume = res.getFieldData(blockName, fieldName: "cshvolume", occursIndex: 0)
        let bdhvolume = res.getFieldData(blockName, fieldName: "bdhvolume", occursIndex: 0)
        let bshvolume = res.getFieldData(blockName, fieldName: "bshvolume", occursIndex: 0)
        let tdvolume = res.getFieldData(blockName, fieldName: "tdvolume", occursIndex: 0)
        let tsvolume = res.getFieldData(blockName, fieldName: "tsvolume", occursIndex: 0)
        let tvol = res.getFieldData(blockName, fieldName: "tvol", occursIndex: 0)
        let tdvalue = res.getFieldData(blockName, fieldName: "tdvalue", occursIndex: 0)
        let tsvalue = res.getFieldData(blockName, fieldName: "tsvalue", occursIndex: 0)
        let tval = res.getFieldData(blockName, fieldName: "tval", occursIndex: 0)
        
        
        
        let result = RESULT_PH_.init(bcCd: type, shcode: shcode, time: time, price: price, sign: sign, change: change, volume: volume, drate: drate, cdhrem: cdhrem, cshrem: cshrem, bdhrem: bdhrem, bshrem: bshrem, cdhvolume: cdhvolume, cshvolume: cshvolume, bdhvolume: bdhvolume, bshvolume: bshvolume, tdvolume: tdvolume, tsvolume: tsvolume, tvol: tvol, tdvalue: tdvalue, tsvalue: tsvalue, tval: tval)
        
        return result
    }
    
    //MARK: - H1 KOSPI호가잔량(H1)
    private static func getResultData_H1(type: String, res: RES) -> REALTIME_RESULT_MODEL{
        let blockName = "OutBlock"
        
        let result = RESULT_H1.init(bcCd: type
                                    , shcode: res.getFieldData(blockName, fieldName: "shcode", occursIndex: 0)
                                    , hotime: res.getFieldData(blockName, fieldName: "hotime", occursIndex: 0)
                                    , offerho1: Int(res.getFieldData(blockName, fieldName: "offerho1", occursIndex: 0))!
                                    , bidho1: Int(res.getFieldData(blockName, fieldName: "bidho1", occursIndex: 0))!
                                    , offerrem1: Int(res.getFieldData(blockName, fieldName: "offerrem1", occursIndex: 0))!
                                    , bidrem1: Int(res.getFieldData(blockName, fieldName: "bidrem1", occursIndex: 0))!
                                    , offerho2: Int(res.getFieldData(blockName, fieldName: "offerho2", occursIndex: 0))!
                                    , bidho2: Int(res.getFieldData(blockName, fieldName: "bidho2", occursIndex: 0))!
                                    , offerrem2: Int(res.getFieldData(blockName, fieldName: "offerrem2", occursIndex: 0))!
                                    , bidrem2: Int(res.getFieldData(blockName, fieldName: "bidrem2", occursIndex: 0))!
                                    , offerho3: Int(res.getFieldData(blockName, fieldName: "offerho3", occursIndex: 0))!
                                    , bidho3: Int(res.getFieldData(blockName, fieldName: "bidho3", occursIndex: 0))!
                                    , offerrem3: Int(res.getFieldData(blockName, fieldName: "offerrem3", occursIndex: 0))!
                                    , bidrem3: Int(res.getFieldData(blockName, fieldName: "bidrem3", occursIndex: 0))!
                                    , offerho4: Int(res.getFieldData(blockName, fieldName: "offerho4", occursIndex: 0))!
                                    , bidho4: Int(res.getFieldData(blockName, fieldName: "bidho4", occursIndex: 0))!
                                    , offerrem4: Int(res.getFieldData(blockName, fieldName: "offerrem4", occursIndex: 0))!
                                    , bidrem4: Int(res.getFieldData(blockName, fieldName: "bidrem4", occursIndex: 0))!
                                    , offerho5: Int(res.getFieldData(blockName, fieldName: "offerho5", occursIndex: 0))!
                                    , bidho5: Int(res.getFieldData(blockName, fieldName: "bidho5", occursIndex: 0))!
                                    , offerrem5: Int(res.getFieldData(blockName, fieldName: "offerrem5", occursIndex: 0))!
                                    , bidrem5: Int(res.getFieldData(blockName, fieldName: "bidrem5", occursIndex: 0))!
                                    , offerho6: Int(res.getFieldData(blockName, fieldName: "offerho6", occursIndex: 0))!
                                    , bidho6: Int(res.getFieldData(blockName, fieldName: "bidho6", occursIndex: 0))!
                                    , offerrem6: Int(res.getFieldData(blockName, fieldName: "offerrem6", occursIndex: 0))!
                                    , bidrem6: Int(res.getFieldData(blockName, fieldName: "bidrem6", occursIndex: 0))!
                                    , offerho7: Int(res.getFieldData(blockName, fieldName: "offerho7", occursIndex: 0))!
                                    , bidho7: Int(res.getFieldData(blockName, fieldName: "bidho7", occursIndex: 0))!
                                    , offerrem7: Int(res.getFieldData(blockName, fieldName: "offerrem7", occursIndex: 0))!
                                    , bidrem7: Int(res.getFieldData(blockName, fieldName: "bidrem7", occursIndex: 0))!
                                    , offerho8: Int(res.getFieldData(blockName, fieldName: "offerho8", occursIndex: 0))!
                                    , bidho8: Int(res.getFieldData(blockName, fieldName: "bidho8", occursIndex: 0))!
                                    , offerrem8: Int(res.getFieldData(blockName, fieldName: "offerrem8", occursIndex: 0))!
                                    , bidrem8: Int(res.getFieldData(blockName, fieldName: "bidrem8", occursIndex: 0))!
                                    , offerho9: Int(res.getFieldData(blockName, fieldName: "offerho9", occursIndex: 0))!
                                    , bidho9: Int(res.getFieldData(blockName, fieldName: "bidho9", occursIndex: 0))!
                                    , offerrem9: Int(res.getFieldData(blockName, fieldName: "offerrem9", occursIndex: 0))!
                                    , bidrem9: Int(res.getFieldData(blockName, fieldName: "bidrem9", occursIndex: 0))!
                                    , offerho10: Int(res.getFieldData(blockName, fieldName: "offerho10", occursIndex: 0))!
                                    , bidho10: Int(res.getFieldData(blockName, fieldName: "bidho10", occursIndex: 0))!
                                    , offerrem10: Int(res.getFieldData(blockName, fieldName: "offerrem10", occursIndex: 0))!
                                    , bidrem10: Int(res.getFieldData(blockName, fieldName: "bidrem10", occursIndex: 0))!
                                    , totofferrem: Int(res.getFieldData(blockName, fieldName: "totofferrem", occursIndex: 0))!
                                    , totbidrem: Int(res.getFieldData(blockName, fieldName: "totbidrem", occursIndex: 0))!
                                    , donsigubun: res.getFieldData(blockName, fieldName: "donsigubun", occursIndex: 0)
                                    , alloc_gubun: res.getFieldData(blockName, fieldName: "alloc_gubun", occursIndex: 0))
        

        return result
    }
    
    //MARK: - SC1 주식주문체결
    private static func getResultData_SC1(type: String, res: RES) -> REALTIME_RESULT_MODEL{
        let blockName = "OutBlock"
//        let shcode = res.getFieldData(blockName, fieldName: "shcode", occursIndex: 0)
//        let time = res.getFieldData(blockName, fieldName: "time", occursIndex: 0)
//        let price = res.getFieldData(blockName, fieldName: "price", occursIndex: 0)
//        let sign = res.getFieldData(blockName, fieldName: "sign", occursIndex: 0)
//        let change = res.getFieldData(blockName, fieldName: "change", occursIndex: 0)
//        let volume = res.getFieldData(blockName, fieldName: "volume", occursIndex: 0)
//        let drate = res.getFieldData(blockName, fieldName: "drate", occursIndex: 0)
//        let cdhrem = res.getFieldData(blockName, fieldName: "cdhrem", occursIndex: 0)
//        let cshrem = res.getFieldData(blockName, fieldName: "cshrem", occursIndex: 0)
//        let bdhrem = res.getFieldData(blockName, fieldName: "bdhrem", occursIndex: 0)
//        let bshrem = res.getFieldData(blockName, fieldName: "bshrem", occursIndex: 0)
//        let cdhvolume = res.getFieldData(blockName, fieldName: "cdhvolume", occursIndex: 0)
//        let cshvolume = res.getFieldData(blockName, fieldName: "cshvolume", occursIndex: 0)
//        let bdhvolume = res.getFieldData(blockName, fieldName: "bdhvolume", occursIndex: 0)
//        let bshvolume = res.getFieldData(blockName, fieldName: "bshvolume", occursIndex: 0)
//        let tdvolume = res.getFieldData(blockName, fieldName: "tdvolume", occursIndex: 0)
//        let tsvolume = res.getFieldData(blockName, fieldName: "tsvolume", occursIndex: 0)
//        let tvol = res.getFieldData(blockName, fieldName: "tvol", occursIndex: 0)
//        let tdvalue = res.getFieldData(blockName, fieldName: "tdvalue", occursIndex: 0)
//        let tsvalue = res.getFieldData(blockName, fieldName: "tsvalue", occursIndex: 0)
//        let tval = res.getFieldData(blockName, fieldName: "tval", occursIndex: 0)
//
        
        
//        let result = RESULT_PH_.init(bcCd: type, shcode: shcode, time: time, price: price, sign: sign, change: change, volume: volume, drate: drate, cdhrem: cdhrem, cshrem: cshrem, bdhrem: bdhrem, bshrem: bshrem, cdhvolume: cdhvolume, cshvolume: cshvolume, bdhvolume: bdhvolume, bshvolume: bshvolume, tdvolume: tdvolume, tsvolume: tsvolume, tvol: tvol, tdvalue: tdvalue, tsvalue: tsvalue, tval: tval)
        let result = RESULT_SC1.init(bcCd: type)
        
        return result
    }
    
}

