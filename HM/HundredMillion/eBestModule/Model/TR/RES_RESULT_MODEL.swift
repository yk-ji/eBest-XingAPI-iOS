//
//  RES_RESULT_MODEL.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/19.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation

//MARK: - TR Type Code
enum TR_TYPE_CD : String{
    case CSPAQ22200 = "CSPAQ22200"  //현물계좌예수금 주문가능금액 총평가2
    case CSPAT00600 = "CSPAT00600"  //현물주문
    case t1102 = "t1102"    //주식현재가(시세)조회
    case t0424 = "t0424"    //주식잔고2
}

protocol RES_RESULT_MODEL {
    var trCd : String {get set}
    var description : String {get}
}

//MARK: - CSPAQ22200 현물계좌예수금 주문가능금액 총평가2
struct RESULT_CSPAQ22200 : RES_RESULT_MODEL{
    var trCd: String
    var description: String = "계좌잔고조회"
//    var shcode : String //단축코드,shcode,shcode,char,6;
    var MnyOrdAbleAmt : String //현금주문가능금액, MnyOrdAbleAmt, MnyOrdAbleAmt, long, 16;
    var SeOrdAbleAmt : String //거래소금액, SeOrdAbleAmt, SeOrdAbleAmt, long, 16;
    var Dps : String //예수금, Dps, Dps, long, 16;
    var PrdaySellAdjstAmt : String //전일매도정산금액, PrdaySellAdjstAmt, PrdaySellAdjstAmt, long, 16;
    var PrdayBuyAdjstAmt : String // 전일매수정산금액, PrdayBuyAdjstAmt, PrdayBuyAdjstAmt, long, 16;
    var CrdaySellAdjstAmt : String //금일매도정산금액, CrdaySellAdjstAmt, CrdaySellAdjstAmt, long, 16;
    var CrdayBuyAdjstAmt : String //금일매수정산금액, CrdayBuyAdjstAmt, CrdayBuyAdjstAmt, long, 16;
}

//MARK: - CSPAT00600 현물주문
struct RESULT_CSPAT00600 : RES_RESULT_MODEL{
    var trCd: String
    var description: String = "현물주문"
    var shcode : String //단축코드,shcode,shcode,char,6;
    var IsuNo : String //종목번호, IsuNo, IsuNo, char, 12;
    var OrdQty : String //주문수량, OrdQty, OrdQty, long, 16;
    var OrdPrc : String //주문가, OrdPrc, OrdPrc, double, 13.2;
    var BnsTpCode : String //매매구분, BnsTpCode, BnsTpCode, char, 1;
    var OrdprcPtnCode : String //호가유형코드, OrdprcPtnCode, OrdprcPtnCode, char, 2;
    var OrdCndiTpCode : String //주문조건구분, OrdCndiTpCode, OrdCndiTpCode, char, 1;
}


//MARK: - t1102 주식현재가(시세)조회
struct RESULT_t1102 : RES_RESULT_MODEL{
    var trCd: String
    var description: String = "주식현재가(시세)조회"
    var shcode : String //단축코드,shcode,shcode,char,6;
    var price : String //현재가,price,price,long,8;
}

//MARK: - t0424 주식잔고2
struct RESULT_t0424_LIST : RES_RESULT_MODEL{
    var trCd: String
    var description: String = "주식잔고2 목록"
    var t0424List : [RESULT_t0424]
}

struct RESULT_t0424 : RES_RESULT_MODEL{
    var trCd: String
    var description: String = "주식잔고2"
    var shcode : String //종목번호,expcode,expcode,char,12;
    var janqty : String //잔고수량,janqty,janqty,long,
    var mdposqt : String //매도가능수량,mdposqt,mdposqt,long,18;
    var pamt : String //평균단가,pamt,pamt,long,18;
    var mamt : String //매입금액,mamt,mamt,long,18;
    var hname : String //종목명,hname,hname,char,20;
    var janrt : String //보유비중,janrt,janrt,float,10.2;
    var price : String //현재가,price,price,long,8;
    var appamt : String //평가금액,appamt,appamt,long,18;
    var dtsunik : String //평가손익,dtsunik,dtsunik,long,18;
    var sunikrt : String //수익율,sunikrt,sunikrt,float,10.2;
    var fee : String //수수료,fee,fee,long,10;
    var tax : String //제세금,tax,tax,long,10;
}



