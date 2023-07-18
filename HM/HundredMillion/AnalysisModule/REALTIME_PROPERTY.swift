//
//  REALTIME_PROPERTY.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/20.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation

struct PH__MODEL {
    init(phInfo: RESULT_PH_) {
        self.shcode = phInfo.shcode
        self._resultList = []
        self._nowPH_Info = phInfo
    }
    
    var shcode : String
    
    private var _tradeFlag : TRADE_FLAG_CD = .HOLDING
    var tradeFlag : TRADE_FLAG_CD {
        get {
            if resultList.count == 0 {
                return .HOLDING
            }else {
                
                var tvolAcc = 0
                var bdhremAcc = 0
                
                for phInfo in resultList {
                    if let preTvol = Int(phInfo.tvol)
                       , let preBdhrem = Int(phInfo.bdhrem){
                        tvolAcc = tvolAcc + preTvol
                        bdhremAcc = bdhremAcc + preBdhrem
                    }else{
                        return .HOLDING
                    }
                }
                
                
                if let nowBdhrem = Int(nowPH_Info.bdhrem)
                   , let nowBshrem = Int(nowPH_Info.bshrem){
                    if nowBdhrem >= nowBshrem
                        && tvolAcc >= bdhremAcc {
                        return .BUY
                    }
                    
                    
                    if Float(nowBdhrem) * 1.5 < Float(nowBshrem)
                        && Float(tvolAcc) * 1.5 < Float(bdhremAcc) {
                        return .SELL
                    }
                }
                return .HOLDING
            }
        }
    }
    
    private var _resultList : [RESULT_PH_]
    var resultList : [RESULT_PH_] {
        get {
            return _resultList
        }
        set(value){
            _resultList = value
        }
    }
    
    private var _nowPH_Info : RESULT_PH_
    var nowPH_Info : RESULT_PH_ {
        get {
            return _nowPH_Info
        }
        set(phInfo) {
            if resultList.count == 10 {
                resultList.removeFirst()
            }
            resultList.append(phInfo)
            _nowPH_Info = phInfo
        }
    }
}

struct H1_MODEL {
    init(h1Info: RESULT_H1) {
        self.shcode = h1Info.shcode
        self._resultList = []
        self.nowH1_Info = h1Info
    }
    
//    var avgOfferrem : String
    private var _cutstomTotalBidrem : Float = 0
    var cutstomTotalBidrem : Float {
        get {
            return _cutstomTotalBidrem
        }
        set {
            _cutstomTotalBidrem = (Float(self.nowH1_Info.bidrem1) * 1)
                + (Float(self.nowH1_Info.bidrem2) * 0.9)
                + (Float(self.nowH1_Info.bidrem3) * 0.8)
                + (Float(self.nowH1_Info.bidrem4) * 0.7)
                + (Float(self.nowH1_Info.bidrem5) * 0.6)
                + (Float(self.nowH1_Info.bidrem6) * 0.5)
                + (Float(self.nowH1_Info.bidrem7) * 0.4)
                + (Float(self.nowH1_Info.bidrem8) * 0.3)
                + (Float(self.nowH1_Info.bidrem9) * 0.2)
                + (Float(self.nowH1_Info.bidrem10) * 0.1)
        }
    }
    
    private var _cutstomTotalOfferrem : Float = 0
    var cutstomTotalOfferrem : Float {
        get {
            return _cutstomTotalOfferrem
        }
        set {
            _cutstomTotalOfferrem = (Float(self.nowH1_Info.offerrem1) * 1)
                + (Float(self.nowH1_Info.offerrem2) * 0.9)
                + (Float(self.nowH1_Info.offerrem3) * 0.8)
                + (Float(self.nowH1_Info.offerrem4) * 0.7)
                + (Float(self.nowH1_Info.offerrem5) * 0.6)
                + (Float(self.nowH1_Info.offerrem6) * 0.5)
                + (Float(self.nowH1_Info.offerrem7) * 0.4)
                + (Float(self.nowH1_Info.offerrem8) * 0.3)
                + (Float(self.nowH1_Info.offerrem9) * 0.2)
                + (Float(self.nowH1_Info.offerrem10) * 0.1)
        }
    }
    
    var shcode : String
    var nowH1_Info : RESULT_H1
    
    private var _tradeFlag : TRADE_FLAG_CD = .HOLDING
    var tradeFlag : TRADE_FLAG_CD
    {
        get {
            if cutstomTotalOfferrem == 0 || cutstomTotalBidrem  == 0 {
                return .HOLDING
            }else {
                // offer 매도 // bid 매수
                if cutstomTotalOfferrem > cutstomTotalBidrem{
                    
                    return .SELL
                }else{
                    
                    return .BUY
                }
                
            }
        }
    }
    
    private var _resultList : [RESULT_PH_]
    var resultList : [RESULT_PH_] {
        get {
            return _resultList
        }
        set(value){
            _resultList = value
        }
    }
    
//    private var _nowH1_Info : RESULT_H1_
    
}

