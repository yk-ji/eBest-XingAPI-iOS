//
//  eBestApiService.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/13.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation
import XingAPIMobile

class eBestApiService {
    private var eBESTAPI : XingAPI!
    private var apiHandler : Int = -1
    
    private var requestTRInfoSet : [String: RES] = [:]
    private var realTimeInfoSet : [String:(shcode: Set<String>, res: RES)] = [:]
    
    
    //MARK: - Init
    init(eBESTAPI : XingAPI, apiHandler : Int) {
        self.eBESTAPI = eBESTAPI
        self.apiHandler = apiHandler
        
    }
    
    
    //MARK: - Functions
    func initResData(resType: String) -> RES?{
        let res = RES.init(resType)
        
        if res.read(){
            return res
        }else{
            LAYOUT_COMMON.showAlert(title: "ALERT", msg: resType + " RES FILE LOADING FAIL")
            return nil
        }
    }
    
    //MARK: - TR Request
    func request_TR(type: String, res: RES , next: Bool = false, continueKey: String = "", compress: Bool = true){
        let data = res.getInputBlockData()
        let result = eBESTAPI.requestData(apiHandler,
                                          code: type,
                                          data: data,
                                          next: next,
                                          continueKey: continueKey,
                                          compress: compress,
                                          timeOut: 30)
        
        
        if result.ok{
            requestTRInfoSet.updateValue(res, forKey: String(result.rqID))
        }else{
            requestTRInfoSet.removeValue(forKey: String(result.rqID))
            LAYOUT_COMMON.showAlert(title: "ALERT", msg: "REQUEST TR FAIL : " + type)
        }
    }
    
    //MARK: - TR Response
    func response_TR(data: ReceiveData) -> RES_RESULT_MODEL?{
        let tr = data.tr
        guard let res = requestTRInfoSet[String(data.rqID)] else {
            LAYOUT_COMMON.showAlert(title: "ALERT", msg: "NOT FOUND REQUEST INFO : " + data.tr)
            return nil
        }
        
        //DataModel Init
        if res.setOutputData(data.data, blockName: data.blockName) {
            let result = RES_FIELD_DAO.getResultData(type: tr, res: res)
            requestTRInfoSet.removeValue(forKey: String(data.rqID))
            return result
        }else{
            requestTRInfoSet.removeValue(forKey: String(data.rqID))
            LAYOUT_COMMON.showAlert(title: "ALERT", msg: "SET OUTPUT DATA FAIL : " + tr)
            return nil
        }
    }
    
    //MARK: - RealTime Start
    func start_RealTime(type: String, shcode: String){
        if let _ = realTimeInfoSet[type]{
            realTimeInfoSet[type]!.shcode.insert(shcode)
        }else{
            if let res = initResData(resType: type){
                realTimeInfoSet.updateValue((shcode: [shcode], res: res), forKey: type)
            }else{
                return
            }
        }
        eBESTAPI.adviseRealData(apiHandler, code: type, key: shcode)
    }
    
    //MARK: - RealTime Stop
    func stop_RealTime(type: String, shcode: String){
        if let _ = realTimeInfoSet[type]{
            realTimeInfoSet[type]!.shcode.remove(shcode)
        }
        eBESTAPI.unAdviseRealData(apiHandler, code: type, key: shcode)
    }
    
    //MARK: - RealTime Result
    func result_RealTime(type: String, shcode: String, data: Data) -> REALTIME_RESULT_MODEL?{
        if let info = realTimeInfoSet[type] {
            if info.shcode.contains(shcode){
                //DataModel Init
                if info.res.setOutputData(data, blockName: ""){
                    return REALTIME_FIELD_DAO.getResultData(type: type, res: info.res)
                }else{
                    LAYOUT_COMMON.showAlert(title: "ALERT", msg: "SET OUTPUT DATA FAIL : " + type)
                }
            }else{
                LAYOUT_COMMON.showAlert(title: "ALERT", msg: type + " DOES NOT HAVE KEY : " + shcode)
            }
        }else{
            LAYOUT_COMMON.showAlert(title: "ALERT", msg: "DOES NOT HAVE BC_CODE : " + type)
        }
        
        stop_RealTime(type: type, shcode: shcode)
        return nil
    }
    
}
