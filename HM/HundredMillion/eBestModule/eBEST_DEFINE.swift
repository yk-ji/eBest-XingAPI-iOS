//
//  KEY_DEFINE.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/13.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation
//import XingAPIMobile

//MARK: - Real/MOTU Server Flag
let isMOTU = true

let STOCKS_LIST = [SH_CD.삼성전자.rawValue
                   ,SH_CD.현대차.rawValue
                   ,SH_CD.SK하이닉스.rawValue
                   ,SH_CD.NAVER.rawValue
                   ,SH_CD.POSCO.rawValue
                   ,SH_CD.SK텔레콤.rawValue
                   ,SH_CD.LG전자.rawValue
                   ,SH_CD.SK이노베이션.rawValue
                   ,SH_CD.삼성SDI.rawValue
                   ,SH_CD.삼성중공업.rawValue
                   ,SH_CD.이마트.rawValue
                   ,SH_CD.LG유플러스.rawValue
                   ,SH_CD.삼성전자우.rawValue
                   ,SH_CD.LG디스플레이.rawValue
                   ,SH_CD.현대중공업.rawValue
                   ,SH_CD.삼성전기.rawValue
                   ,SH_CD.LG전자우.rawValue
                   ,SH_CD.기업은행.rawValue
                   ,SH_CD.CJ.rawValue
                   ,SH_CD.카카오.rawValue
                   ,SH_CD.셀트리온.rawValue]



enum SH_CD : String{
    case 삼성전자 = "005930"
    case 현대차 = "005380"
    case SK하이닉스 = "000660"
    case NAVER = "035420"
    case POSCO = "005490"
    case SK텔레콤 = "017670"
    case LG전자 = "066570"
    case SK이노베이션 = "096770"
    case 삼성SDI = "006400"
    case 삼성중공업 = "010140"
    case 이마트 = "139480"
    case LG유플러스 = "032640"
    case 삼성전자우 = "005935"
    case LG디스플레이 = "034220"
    case 현대중공업 = "009540"
    case 삼성전기 = "009150"
    case LG전자우 = "066575"
    case 기업은행 = "024110"
    case CJ = "001040"
    case 카카오 = "035720"
    case 셀트리온 = "068270"
}


enum BNS_TP_CD : String{
    case SELL = "1"
    case BUY = "2"
}



