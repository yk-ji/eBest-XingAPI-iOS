//
//  MainViewController.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/13.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation
import UIKit
import XingAPIMobile

extension MainViewController: SharedDataSyncProtocol {
    func syncData(dataType : String) {
        if dataType == TR_TYPE_CD.CSPAQ22200.rawValue {
            if let data = SharedDataModel.shared.CSPAQ22200{
                lblDps.text = data.Dps.convertDecimalPrice
                lblMnyOrdAbleAmt.text = data.MnyOrdAbleAmt.convertDecimalPrice
                lblPrdaySellAdjstAmt.text = data.PrdaySellAdjstAmt.convertDecimalPrice
                lblPrdayBuyAdjstAmt.text = data.PrdayBuyAdjstAmt.convertDecimalPrice
                lblCrdayBuyAdjstAmt.text = data.CrdayBuyAdjstAmt.convertDecimalPrice
                lblCrdaySellAdjstAmt.text = data.CrdaySellAdjstAmt.convertDecimalPrice
            }
        }
    }
}


class MainViewController: UIViewController {
    @IBOutlet weak var lblAccountName: UILabel!
    @IBOutlet weak var lblAccountNum: UILabel!
    @IBOutlet weak var lblMnyOrdAbleAmt: UILabel!
    @IBOutlet weak var lblDps: UILabel!
    @IBOutlet weak var lblPrdaySellAdjstAmt: UILabel!
    @IBOutlet weak var lblPrdayBuyAdjstAmt: UILabel!
    @IBOutlet weak var lblCrdaySellAdjstAmt: UILabel!
    @IBOutlet weak var lblCrdayBuyAdjstAmt: UILabel!
    
    var acntNo : String?
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAccountInfo()
//        RealmConfig.getDocumentsDirectory()
    }
    
    //MARK: - Functions
    func getAccountInfo(){
        if let account = StocksAPI.shared.eBESTAPI.getAccountList().first{
            acntNo = account.acntNo
            
            var nameStr = ""
            nameStr = "AcntNm : " + StocksAPI.shared.eBESTAPI.getAccountName(account.acntNo) + " | AcntDetail : " + StocksAPI.shared.eBESTAPI.getAccountDetailName(account.acntNo)
            
            lblAccountName.text = nameStr
            lblAccountNum.text = "AcntNo : " + account.acntNo
        }
    }
    
    //MARK: - IBAction
    @IBAction func accountRefresh(_ sender: Any) {
        StocksAPI.shared.requestCSPAQ22200()
    }
}
