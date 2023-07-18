//
//  STOCKS_INFO.swift
//  HundredMillion
//
//  Created by youngkwanji on 2021/02/18.
//  Copyright © 2021 youngkwanji. All rights reserved.
//

import Foundation

protocol STOCKS_INFO  {
    var shcode : String {get set} // 종목코드
    var hname : String {get set} // 종목명
    var price : String {get set} // 현재가
}

extension STOCKS_INFO {}


struct HOLDING_STOCKS : STOCKS_INFO{
    var shcode : String //종목번호,expcode,expcode,char,12;
    var hname : String //종목명,hname,hname,char,20;
    var price : String //현재가,price,price,long,8;
    var janqty : String //잔고수량,janqty,janqty,long,
    var pamt : String //평균단가,pamt,pamt,long,18;
}
