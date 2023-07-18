//
//  REALTIME_RESULT_MODEL.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/19.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation

//MARK: - RealTime Type Code
enum REALTIME_TYPE_CD : String{
    case S3_ = "S3_"  //KOSPI체결
    case PH_ = "PH_"  //KOSPI프로그램매매종목별(PH)
    case SC1 = "SC1"  //주식주문체결
    case H1 = "H1"  //KOSPI호가잔량(H1)
}

protocol REALTIME_RESULT_MODEL {
    var bcCd : String {get set}
    var description : String {get}
}

//MARK: - S3_ KOSPI체결
struct RESULT_S3_ : REALTIME_RESULT_MODEL{
    var bcCd: String
    var shcode: String
    var description: String = "KOSPI체결"
    var chetime : String //체결시간,        chetime,    chetime,    char,    6;
    var sign : String //전일대비구분,    sign,        sign,        char,    1;
    var change : String //전일대비,        change,        change,        long,    8;
    var drate : String //등락율,            drate,        drate,        float,    6.2;
    var price : String //현재가,            price,        price,        long,    8;
    var opentime : String //시가시간,        opentime,    opentime,    char,    6;
    var open : String //시가,            open,        open,        long,    8;
    var hightime : String //고가시간,        hightime,    hightime,    char,    6;
    var high : String //고가,            high,        high,        long,    8;
    var lowtime : String //저가시간,        lowtime,    lowtime,    char,    6;
    var low : String //저가,            low,        low,        long,    8;
    var cgubun : String //체결구분,        cgubun,        cgubun,        char,    1;
    var cvolume : String //체결량,            cvolume,    cvolume,    long,    8;
    var volume : String //누적거래량,        volume,        volume,        long,    12;
    var value : String //누적거래대금,    value,        value,        long,    12;
    var mdvolume : String //매도누적체결량,    mdvolume,    mdvolume,    long,    12;
    var mdchecnt : String //매도누적체결건수,    mdchecnt,    mdchecnt,    long,    8;
    var msvolume : String //매수누적체결량,    msvolume,    msvolume,    long,    12;
    var mschecnt : String //매수누적체결건수,    mschecnt,    mschecnt,    long,    8;
    var cpower : String //체결강도,        cpower,        cpower,        float,    9.2;
    var w_avrg : String //가중평균가,        w_avrg,        w_avrg,        long,    8;
    var offerho : String //매도호가,        offerho,    offerho,    long,    8;
    var bidho : String //매수호가,        bidho,        bidho,        long,    8;
    var status : String //장정보,            status,        status,        char,    2;
    var jnilvolume : String //전일동시간대거래량,    jnilvolume,    jnilvolume,    long,    12;
}

//MARK: - PH_ KOSPI프로그램매매종목별(PH)
struct RESULT_PH_ : REALTIME_RESULT_MODEL{
    var bcCd: String
    var shcode: String
    var description: String = "KOSPI프로그램매매종목별(PH)"
    var time : String //수신시간,                   time,           time,       char,   6;
    var price : String //현재가,                     price,          price,      long,   8;
    var sign : String //전일대비구분,               sign,           sign,       long,   1;
    var change : String //전일대비,                   change,         change,     long,   8;
    var volume : String //누적거래량,                 volume,         volume,     long,   10;
    var drate : String //등락율,                     drate,          drate,      float,  6.2;
    var cdhrem : String //차익매도호가 잔량,          cdhrem,         cdhrem,     long,   9;
    var cshrem : String //차익매수호가 잔량,          cshrem,         cshrem,     long,   9;
    var bdhrem : String //비차익매도호가 잔량,        bdhrem,         bdhrem,     long,   9;
    var bshrem : String //비차익매수호가 잔량,        bshrem,         bshrem,     long,   9;
    var cdhvolume : String //차익매도호가 수량,          cdhvolume,      cdhvolume,  long,   9;
    var cshvolume : String //차익매수호가 수량,          cshvolume,      cshvolume,  long,   9;
    var bdhvolume : String //비차익매도호가 수량,        bdhvolume,      bdhvolume,  long,   9;
    var bshvolume : String //비차익매수호가 수량,        bshvolume,      bshvolume,  long,   9;
    var tdvolume : String //전체매도체결수량,           tdvolume,       tdvolume,   long,   9;
    var tsvolume : String //전체매수체결수량,           tsvolume,       tsvolume,   long,   9;
    var tvol : String //전체순매수 수량,            tvol,           tvol,       long,   9;
    var tdvalue : String //전체매도체결금액,           tdvalue,        tdvalue,    long,   12;
    var tsvalue : String //전체매수체결금액,           tsvalue,        tsvalue,    long,   12;
    var tval : String //전체순매수 금액,            tval,           tval,       long,   12;
}

//MARK: - H1 KOSPI호가잔량(H1)
struct RESULT_H1 : REALTIME_RESULT_MODEL{
    var bcCd: String
    var shcode: String
    var description: String = "KOSPI호가잔량(H1)"
    var hotime : String // 호가시간,            hotime,            hotime,            char,    6;
    var offerho1 : Int //매도호가1,            offerho1,        offerho1,        long,    7;
    var bidho1 : Int //매수호가1,            bidho1,            bidho1,            long,    7;
    var offerrem1 : Int // 매도호가잔량1,        offerrem1,        offerrem1,        long,    9;
    var bidrem1 : Int //매수호가잔량1,        bidrem1,        bidrem1,        long,    9;
    var offerho2 : Int //매도호가2,            offerho2,        offerho2,        long,    7;
    var bidho2 : Int //매수호가2,            bidho2,            bidho2,            long,    7;
    var offerrem2 : Int // 매도호가잔량2,        offerrem2,        offerrem2,        long,    9;
    var bidrem2 : Int //매수호가잔량2,        bidrem2,        bidrem2,        long,    9;
    var offerho3 : Int // 매도호가3,            offerho3,        offerho3,        long,    7;
    var bidho3 : Int // 매수호가3,            bidho3,            bidho3,            long,    7;
    var offerrem3 : Int // 매도호가잔량3,        offerrem3,        offerrem3,        long,    9;
    var bidrem3 : Int // 매수호가잔량3,        bidrem3,        bidrem3,        long,    9;
    var offerho4: Int // 매도호가4,            offerho4,        offerho4,        long,    7;
    var bidho4: Int // 매수호가4,            bidho4,            bidho4,            long,    7;
    var offerrem4: Int // 매도호가잔량4,        offerrem4,        offerrem4,        long,    9;
    var bidrem4: Int // 매수호가잔량4,        bidrem4,        bidrem4,        long,    9;
    var offerho5: Int // 매도호가5,            offerho5,        offerho5,        long,    7;
    var bidho5: Int // 매수호가5,            bidho5,            bidho5,            long,    7;
    var offerrem5: Int // 매도호가잔량5,        offerrem5,        offerrem5,        long,    9;
    var bidrem5: Int // 매수호가잔량5,        bidrem5,        bidrem5,        long,    9;
    var offerho6: Int // 매도호가6,            offerho6,        offerho6,        long,    7;
    var bidho6: Int // 매수호가6,            bidho6,            bidho6,            long,    7;
    var offerrem6: Int // 매도호가잔량6,        offerrem6,        offerrem6,        long,    9;
    var bidrem6: Int // 매수호가잔량6,        bidrem6,        bidrem6,        long,    9;
    var offerho7: Int // 매도호가7,            offerho7,        offerho7,        long,    7;
    var bidho7: Int // 매수호가7,            bidho7,            bidho7,            long,    7;
    var offerrem7: Int // 매도호가잔량7,        offerrem7,        offerrem7,        long,    9;
    var bidrem7: Int // 매수호가잔량7,        bidrem7,        bidrem7,        long,    9;
    var offerho8: Int // 매도호가8,            offerho8,        offerho8,        long,    7;
    var bidho8: Int // 매수호가8,            bidho8,            bidho8,            long,    7;
    var offerrem8: Int // 매도호가잔량8,        offerrem8,        offerrem8,        long,    9;
    var bidrem8: Int // 매수호가잔량8,        bidrem8,        bidrem8,        long,    9;
    var offerho9: Int // 매도호가9,            offerho9,        offerho9,        long,    7;
    var bidho9: Int // 매수호가9,            bidho9,            bidho9,            long,    7;
    var offerrem9: Int // 매도호가잔량9,        offerrem9,        offerrem9,        long,    9;
    var bidrem9: Int // 매수호가잔량9,        bidrem9,        bidrem9,        long,    9;
    var offerho10: Int // 매도호가10,            offerho10,        offerho10,        long,    7;
    var bidho10: Int // 매수호가10,            bidho10,        bidho10,        long,    7;
    var offerrem10: Int // 매도호가잔량10,        offerrem10,        offerrem10,        long,    9;
    var bidrem10: Int // 매수호가잔량10,        bidrem10,        bidrem10,        long,    9;
    var totofferrem: Int // 총매도호가잔량,        totofferrem,    totofferrem,    long,    9;
    var totbidrem: Int // 총매수호가잔량,        totbidrem,        totbidrem,        long,    9;
    var donsigubun: String // 동시호가구분,        donsigubun,        donsigubun,        char,    1;
    var alloc_gubun: String // 배분적용구분,        alloc_gubun,    alloc_gubun,    char,    1;
}


//MARK: - SC1 주식주문체결
struct RESULT_SC1 : REALTIME_RESULT_MODEL{
    var bcCd: String
//    var shcode: String
    var description: String = "주식주문체결"
}
