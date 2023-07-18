//
//  RealtimeAnalysis.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/20.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation
import UIKit

protocol RealtimeAnalysisDelegate {
    func getTradeFlag(tradeCd: TRADE_FLAG_CD, stocks: PH__MODEL)
}

class RealtimeAnalysis{
    var delegate : RealtimeAnalysisDelegate?
    private var realTimeInfoSet : [String:PH__MODEL] = [:]
    var tradeHistoryList : [RESULT_SC1] = []
    
    static let shared = RealtimeAnalysis()
    
    func setRealTimeResult(data: REALTIME_RESULT_MODEL){
        switch data.bcCd {
        case REALTIME_TYPE_CD.S3_.rawValue:
            break
        case REALTIME_TYPE_CD.PH_.rawValue:
            if let phInfo = data as? RESULT_PH_{
                if let _ = realTimeInfoSet[phInfo.shcode] {
                    realTimeInfoSet[phInfo.shcode]!.nowPH_Info = phInfo
                }else{
                    realTimeInfoSet.updateValue(PH__MODEL.init(phInfo: phInfo), forKey: phInfo.shcode)
                }
                
                self.getTradeFlag(tradeCd: realTimeInfoSet[phInfo.shcode]!.tradeFlag, stocks: realTimeInfoSet[phInfo.shcode]!)
            }
            break
        case REALTIME_TYPE_CD.SC1.rawValue:
            if let sc1Info = data as? RESULT_SC1{
//                tradeHistoryList.append(sc1Info)
//                if let _ = realTimeInfoSet[phInfo.shcode] {
//                    realTimeInfoSet[phInfo.shcode]!.nowPH_Info = phInfo
//                }else{
//                    realTimeInfoSet.updateValue(PH__MODEL.init(phInfo: phInfo), forKey: phInfo.shcode)
//                }
//
//                self.getTradeFlag(tradeCd: realTimeInfoSet[phInfo.shcode]!.tradeFlag, stocks: realTimeInfoSet[phInfo.shcode]!)
            }
            break
        case REALTIME_TYPE_CD.H1.rawValue:
            if let phInfo = data as? RESULT_H1{
//                if let _ = realTimeInfoSet[phInfo.shcode] {
//                    realTimeInfoSet[phInfo.shcode]!.nowPH_Info = phInfo
//                }else{
//                    realTimeInfoSet.updateValue(PH__MODEL.init(phInfo: phInfo), forKey: phInfo.shcode)
//                }
                
//                self.getTradeFlag(tradeCd: realTimeInfoSet[phInfo.shcode]!.tradeFlag, stocks: realTimeInfoSet[phInfo.shcode]!)
            }
            break
        default:
            break
        }
    }
}

extension RealtimeAnalysis : RealtimeAnalysisDelegate{
    func getTradeFlag(tradeCd: TRADE_FLAG_CD, stocks: PH__MODEL) {
        delegate?.getTradeFlag(tradeCd: tradeCd, stocks: stocks)
    }
}
 


