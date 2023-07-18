////
////  HOLDING_STOCKS_INFO.swift
////  HundredMillion
////
////  Created by youngkwanji on 2021/02/18.
////  Copyright © 2021 youngkwanji. All rights reserved.
////
//
//import Foundation
//
//
//struct HOLDING_STOCKS_INFO : STOCKS_INFO{
//    init(phInfo: RESULT_PH_) {
//        self.shcode = phInfo.shcode
//        self._resultList = []
//        self._nowPH_Info = phInfo
//    }
//    
//    var shcode : String
//    
//    private var _tradeFlag : TRADE_FLAG_CD = .HOLDING
//    var tradeFlag : TRADE_FLAG_CD {
//        get {
//            if resultList.count == 0 {
//                return .HOLDING
//            }else {
//                
//                var tvolAcc = 0
//                var bdhremAcc = 0
//                
//                for phInfo in resultList {
//                    if let preTvol = Int(phInfo.tvol)
//                       , let preBdhrem = Int(phInfo.bdhrem){
//                        tvolAcc = tvolAcc + preTvol
//                        bdhremAcc = bdhremAcc + preBdhrem
//                    }else{
//                        return .HOLDING
//                    }
//                }
//                
//                
//                if let nowBdhrem = Int(nowPH_Info.bdhrem)
//                   , let nowBshrem = Int(nowPH_Info.bshrem){
//                    if nowBdhrem >= nowBshrem
//                        && tvolAcc >= bdhremAcc {
//                        return .BUY
//                    }
//                    
//                    
//                    if Float(nowBdhrem) * 1.5 < Float(nowBshrem)
//                        && Float(tvolAcc) * 1.5 < Float(bdhremAcc) {
//                        return .SELL
//                    }
//                }
//                return .HOLDING
//            }
//        }
//    }
//    
//    private var _resultList : [RESULT_PH_]
//    var resultList : [RESULT_PH_] {
//        get {
//            return _resultList
//        }
//        set(value){
//            _resultList = value
//        }
//    }
//    
//    private var _nowPH_Info : RESULT_PH_
//    var nowPH_Info : RESULT_PH_ {
//        get {
//            return _nowPH_Info
//        }
//        set(phInfo) {
//            if resultList.count == 10 {
//                resultList.removeFirst()
//            }
//            resultList.append(phInfo)
//            _nowPH_Info = phInfo
//        }
//    }
//}
//
//
//
//class HolindgStocks {
//    var list : [MY_STOCKS_INFO] = []
//    
//    init(phInfo: RESULT_PH_) {
//        self.shcode = phInfo.shcode
//        self._resultList = []
//        self._nowPH_Info = phInfo
//    }
//    
//    var shcode : String
//    
//    private var _tradeFlag : TRADE_FLAG_CD = .HOLDING
//    var tradeFlag : TRADE_FLAG_CD {
//        
//        get {
//            if resultList.count == 0 {
//                return .HOLDING
//            }else {
//                
//                var tvolAcc = 0
//                var bdhremAcc = 0
//                
//                for phInfo in resultList {
//                    if let preTvol = Int(phInfo.tvol)
//                       , let preBdhrem = Int(phInfo.bdhrem){
//                        tvolAcc = tvolAcc + preTvol
//                        bdhremAcc = bdhremAcc + preBdhrem
//                    }else{
//                        return .HOLDING
//                    }
//                }
//                
//                
//                if let nowBdhrem = Int(nowPH_Info.bdhrem)
//                   , let nowBshrem = Int(nowPH_Info.bshrem){
//                    if nowBdhrem >= nowBshrem
//                        && tvolAcc >= bdhremAcc {
//                        return .BUY
//                    }
//                    
//                    
//                    if Float(nowBdhrem) * 1.5 < Float(nowBshrem)
//                        && Float(tvolAcc) * 1.5 < Float(bdhremAcc) {
//                        return .SELL
//                    }
//                }
//                return .HOLDING
//            }
//        }
//    }
//    
//    private var _resultList : [RESULT_PH_]
//    var resultList : [RESULT_PH_] {
//        get {
//            return _resultList
//        }
//        set(value){
//            _resultList = value
//        }
//    }
//    
//    private var _nowPH_Info : RESULT_PH_
//    var nowPH_Info : RESULT_PH_ {
//        get {
//            return _nowPH_Info
//        }
//        set(phInfo) {
//            if resultList.count == 10 {
//                resultList.removeFirst()
//            }
//            resultList.append(phInfo)
//            _nowPH_Info = phInfo
//        }
//    }
//}
//
