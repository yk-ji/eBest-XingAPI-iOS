//
//  KEY_DEFINE.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/13.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation

struct USER_DEFAULT_CD {
    static let AUTO_LOGIN = "AUTO_LOGIN"
    static let CERT_PIN = "CERT_PIN"
    static let GOOGLE_DRIVE = "GOOGLE_DRIVE"
    static let IS_REAL = "IS_REAL"
}

struct SCHED_TIME_CD {
    static let AUTO_START_TIME = "08:20"
    static let AUTO_STOP_TIME = "18:10"
    static let CONVERT_CSV_TIME = "18:15"
    static let DRIVE_UPLOAD_TIME = "18:30"
}


enum TRADE_FLAG_CD : String{
    case SELL
    case BUY
    case HOLDING
}


