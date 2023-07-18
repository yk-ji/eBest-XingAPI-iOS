//
//  StocksManageViewController.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/13.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation
import UIKit
import XingAPIMobile

class StocksManageViewController: UIViewController {
    @IBOutlet weak var sgAutoFlag: UISegmentedControl!
    @IBOutlet weak var lblKospi: UILabel!
    @IBOutlet weak var tvHodings: UITableView!
    @IBOutlet weak var tvTradeHistory: UITableView!
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        tvHodings.delegate = self
//        tvHodings.dataSource = self
//        tvTradeHistory.delegate = self
//        tvTradeHistory.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.parent?.title = "StocksManage"
    }
    
    //MARK: - Functions
    func getAccountInfo(){
//        if let account = eBESTAPI.getAccountList().first{
//            acntNo = account.acntNo
//
//            var nameStr = ""
//            nameStr = "AcntNm : " + eBESTAPI.getAccountName(account.acntNo) + " | AcntDetail : " + eBESTAPI.getAccountDetailName(account.acntNo)
//
//            lblAccountName.text = nameStr
//            lblAccountNum.text = "AcntNo : " + account.acntNo
//        }
    }
    
    func setAccountDetailInfo(resultData: RESULT_CSPAQ22200){
//        lblDps.text = FUNC_COMMON.convertDecimalPrice(price: resultData.Dps)
//        lblMnyOrdAbleAmt.text = FUNC_COMMON.convertDecimalPrice(price: resultData.MnyOrdAbleAmt)
//        lblPrdaySellAdjstAmt.text = FUNC_COMMON.convertDecimalPrice(price: resultData.PrdaySellAdjstAmt)
//        lblPrdayBuyAdjstAmt.text = FUNC_COMMON.convertDecimalPrice(price: resultData.PrdayBuyAdjstAmt)
//        lblCrdayBuyAdjstAmt.text = FUNC_COMMON.convertDecimalPrice(price: resultData.CrdayBuyAdjstAmt)
//        lblCrdaySellAdjstAmt.text = FUNC_COMMON.convertDecimalPrice(price: resultData.CrdaySellAdjstAmt)
    }
    
    //MARK: - IBAction
    @IBAction func accountRefresh(_ sender: Any) {
//        guard let res = apiService.initResData(resType: RES_TYPE_CD.CSPAQ22200) else {
//            LAYOUT_COMMON.showAlert(title: "ALERT", msg: RES_TYPE_CD.CSPAQ22200.rawValue + " RES NULL")
//            return
//        }
//
//
//        RES_FIELD_DAO.setField_CSPAQ22200(res: res, acntNo: acntNo!, pwd: "7024")
//        apiService.request_TR(type: RES_TYPE_CD.CSPAQ22200, res: res)
    }
}
//
////MARK: - UITableViewDelegate, UITableViewDataSource
//extension StocksManageViewController : UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if tableView == tvHodings {
//            return 5
//        }else if tableView == tvTradeHistory {
//            return 5
//        }else{
//            return 0
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if tableView == tvHodings {
//            return UITableViewCell()
//        }else if tableView == tvTradeHistory {
//            return UITableViewCell()
//        }else{
//            return UITableViewCell()
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if tableView == tvHodings {
//            return "Hodings"
//        }else if tableView == tvTradeHistory {
//            return "TradeHistory"
//        }else{
//            return ""
//        }
//    }
//    
//}
//
//
////MARK: - XingReceive
//extension StocksManageViewController {
//    override func onReceiveData(_ data: ReceiveData!) {
////        if let result = apiService.response_TR(data: data){
////            switch result.trCd {
////            case RES_TYPE_CD.CSPAQ22200.rawValue:
////                if let accountData = result as? RESULT_CSPAQ22200 {
////                    setAccountDetailInfo(resultData: accountData)
////                }else{
////                    LAYOUT_COMMON.showAlert(title: "ALERT", msg: RES_TYPE_CD.CSPAQ22200.rawValue + " DATA PARSE FAIL")
////                }
////                break
////            default:
////                break
////            }
////        }
//    }
//    
//    override func onReleaseData(_ rqID: Int, code: String!) {
//        print("StocksManageViewController-onReleaseData" + String(rqID) + " " + code)
//    }
//    
//    override func onTimeOut(_ rqID: Int, code: String!) {
//        print("StocksManageViewController-onTimeOut")
//    }
//    
//    override func onReceiveRealData(_ bcCode: String!, key: String!, data: Data!) {
//        print("StocksManageViewController-onReceiveRealData")
//    }
//    
//    override func onRetryConnnect(_ count: Int) {
//        print("StocksManageViewController-onRetryConnnect " + String(count))
//    }
//
//    override func onDisconnect() {
//        print("StocksManageViewController-onDisconnect")
//    }
//    
//    override func onReceiveMessage(_ msg: ReceiveMessage!) {
//        print("StocksManageViewController-onReceiveMessage " + msg.message)
//        
//    }
//
//    override func onReceiveError(_ msg: ReceiveMessage!) {
//        print("StocksManageViewController-onReceiveError " + msg.message)
//    }
//}
