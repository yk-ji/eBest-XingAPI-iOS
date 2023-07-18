//
//  TradeViewController.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/13.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation
import UIKit
import XingAPIMobile

extension TradeViewController: SharedDataSyncProtocol {
    func syncData(dataType : String) {
        
        if dataType == TR_TYPE_CD.CSPAQ22200.rawValue {
            if let data = SharedDataModel.shared.CSPAQ22200{
              
            }
        }else if dataType == TR_TYPE_CD.CSPAQ22200.rawValue {
            
        }else if dataType == TR_TYPE_CD.CSPAQ22200.rawValue {
            
        }
    }
}

class TradeViewController: UIViewController {
    @IBOutlet weak var sgAutoFlag: UISegmentedControl!
    @IBOutlet weak var lblKospi: UILabel!
    @IBOutlet weak var tvHodings: UITableView!
    @IBOutlet weak var tvTradeHistory: UITableView!
    @IBOutlet weak var indiAuto: UIActivityIndicatorView!
    let UD = UserDefaults.standard
    var holdingList : RESULT_t0424_LIST = RESULT_t0424_LIST.init(trCd: TR_TYPE_CD.t0424.rawValue, t0424List: [])
    
    @IBOutlet weak var cvHoldingStocks: UICollectionView!
    var list = ["1", "2", "3", "4" ,"5", "6", "7", "8", "9", "10"]
    
//    var shcodeList = ["005930", "000660","035720","035420"]
    var shcodeList = STOCKS_LIST
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cvHoldingStocks.delegate = self
        cvHoldingStocks.dataSource = self
        
//        cvHoldingStocks.translatesAutoresizingMaskIntoConstraints = false
//        tvHodings.delegate = self
//        tvHodings.dataSource = self
//        tvTradeHistory.delegate = self
//        tvTradeHistory.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        RealtimeAnalysis.shared.delegate = self
    }
    
    //CollectionView Landscape check
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        guard let cv = cvHoldingStocks, let flowLayout = cv.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        flowLayout.invalidateLayout()
    }
    
    //MARK: - Functions
//    func setAnalysisInfo(resultData: RESULT_PH_){
//        RealtimeAnalysis.shared.setRealTimeInfo(data: resultData)
//    }
    // 150

    //MARK: - IBAction
    @IBAction func sgAutoTrade(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            //ON
            for i in 0..<shcodeList.count{
                // 초당 건수 제한 때문에 1초 딜레이 요청
                Timer.scheduledTimer(timeInterval: TimeInterval(i), target: self, selector: #selector(StocksAPI.shared.requestT1102(sender:)), userInfo:shcodeList[i], repeats: false)
            }
//            for cd in shcodeList {
//                requestT1102(shcode: cd)
//            }
            indiAuto.startAnimating()
        }else{
            //OFF
            for cd in shcodeList {
                StocksAPI.shared.apiService.stop_RealTime(type: REALTIME_TYPE_CD.S3_.rawValue, shcode: cd)
                StocksAPI.shared.apiService.stop_RealTime(type: REALTIME_TYPE_CD.PH_.rawValue, shcode: cd)
//                apiService.stop_RealTime(type: REALTIME_TYPE_CD.SC1.rawValue, shcode: cd)
            }
            indiAuto.stopAnimating()
        }
    }
    
    @IBAction func holdingRefresh(_ sender: Any) {
//        guard let acntNo = AppDelegate.shared()?.acntNo, let pwd = AppDelegate.shared()?.pwd  else {
//            return
//        }
//        requestT0424(acntNo: acntNo, pwd: pwd)
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension TradeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HoldingCollectionCell", for: indexPath) as! HoldingCollectionCell
        
        cell.backgroundColor = UIColor.init(hex: HEX_COLOR_KEY.DARK_NAVY_VIEW.rawValue)
//        cell.lbltest.text = list[indexPath.row]
//        cell.lbltest.backgroundColor = .yellow
        
        return cell
    }
    
    //UICollectionViewDelegateFlowLayout
    // 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    // 옆 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.5
    }

    // cell 사이즈( 옆 라인을 고려하여 설정 )
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        var divide : CGFloat = 2
        if UIDevice.current.orientation == .landscapeLeft
            || UIDevice.current.orientation == .landscapeRight {
            divide = 3
        }
    
        let width = collectionView.frame.width / divide - 2.5 ///  3등분하여 배치, 옆 간격이 1이므로 1을 빼줌
//        let width = collectionView.frame.width / 3 - 2.5 ///  3등분하여 배치, 옆 간격이 1이므로 1을 빼줌
        let height = width / 2
        print("collectionView width=\(collectionView.frame.width)")
        print("cell하나당 width=\(width)")
        print("cell하나당 height=\(height)")
        print("root view width = \(self.view.frame.width)")

        let size = CGSize(width: width, height: height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
           
           //ofKind에 UICollectionView.elementKindSectionHeader로 헤더를 설정해주고
           //withReuseIdentifier에 헤더뷰 identifier를 넣어주고
           //생성한 헤더뷰로 캐스팅해준다.
           let headerview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HoldingCollectionHeader", for: indexPath)
        
           return headerview
       }
}



//MARK: - UITableViewDelegate, UITableViewDataSource
//extension TradeViewController : UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if tableView == tvHodings {
//            return holdingList.t0424List.count
//        }else if tableView == tvTradeHistory {
//            return RealtimeAnalysis.shared.tradeHistoryList.count
//        }else{
//            return 0
//        }
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if tableView == tvHodings {
//            return 100
//        }else if tableView == tvTradeHistory {
//            return 70
//        }else{
//            return 0
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if tableView == tvHodings {
//            let reuseString = "HoldingCell"
//            var cell : HoldingCell!
//
//            cell = tableView.dequeueReusableCell(withIdentifier: reuseString) as? HoldingCell
//
//            if cell == nil {
//                tableView.register(UINib.init(nibName: reuseString, bundle: nil), forCellReuseIdentifier: reuseString)
//                cell = tableView.dequeueReusableCell(withIdentifier: reuseString) as? HoldingCell
//            }
//
//            cell.setHoldingInfo(info: holdingList.t0424List[indexPath.row])
//            cell.selectionStyle = .none
//            return cell
//        }else if tableView == tvTradeHistory {
//            return UITableViewCell()
//        }else{
//            return UITableViewCell()
//        }
//    }
//
//    //
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

//MARK: - RealtimeAnalysisDelegate
extension TradeViewController : RealtimeAnalysisDelegate{
    func getTradeFlag(tradeCd: TRADE_FLAG_CD, stocks: PH__MODEL) {
//        guard let acntNo = AppDelegate.shared()?.acntNo, let pwd = AppDelegate.shared()?.pwd  else {
//            return
//        }
//
//        print(tradeCd)
//        switch tradeCd {
//        case .HOLDING:
//            break
//        case .BUY:
//            let qty = UD.integer(forKey: stocks.shcode)
//
//            if 0 != qty{
//                if 25000000 > (Int(stocks.nowPH_Info.price) ?? 0) * qty {
//                    let buyQtyF = 1000000.0 / (Double(stocks.nowPH_Info.price) ?? 0.0)
//                    let buyQty = Int(buyQtyF)
//                    let newQty = qty + buyQty
//                    UD.setValue(newQty, forKey: stocks.shcode)
//
//                    requestCSPAT00600(acntNo: acntNo, pwd: pwd, IsuNo: stocks.shcode, OrdQty: String(buyQty), OrdPrc: "0", BnsTpCode: .BUY, OrdprcPtnCode : "03")
//                    PushNotiService.init().showNotification(title: "BUY STOCKS : " + stocks.shcode, body: "BUY: " + String(buyQty) + "ea, total: " + String(newQty) + "ea")
//                }else{
//                    return
//                }
//            }else{
//                let buyQtyF = 1000000.0 / (Double(stocks.nowPH_Info.price) ?? 0.0)
//                let buyQty = Int(buyQtyF)
//
//                UD.setValue(buyQty, forKey: stocks.shcode)
//                requestCSPAT00600(acntNo: acntNo, pwd: pwd, IsuNo: stocks.shcode, OrdQty: String(buyQty), OrdPrc: "0", BnsTpCode: .BUY, OrdprcPtnCode : "03")
//                PushNotiService.init().showNotification(title: "BUY STOCKS : " + stocks.shcode, body: "BUY: " + String(buyQty) + "ea, total: " + String(buyQty) + "ea")
//            }
//            break
//        case .SELL:
//            let qty = UD.integer(forKey: stocks.shcode)
//
//            if 0 != qty{
//
//                if qty < 10 {
//                    UD.setValue(0, forKey: stocks.shcode)
//
//                    requestCSPAT00600(acntNo: acntNo, pwd: pwd, IsuNo: stocks.shcode, OrdQty: "1", OrdPrc: String(qty), BnsTpCode: .SELL, OrdprcPtnCode : "03")
//                    PushNotiService.init().showNotification(title: "SELL STOCKS : " + stocks.shcode, body: "SELL: " + String(qty) + "ea, total: 0ea")
//                }else{
//                    let sellQty = qty / 10
//                    let newQty = qty - sellQty
//                    UD.setValue(newQty, forKey: stocks.shcode)
//
//                    requestCSPAT00600(acntNo: acntNo, pwd: pwd, IsuNo: stocks.shcode, OrdQty: "1", OrdPrc: String(sellQty), BnsTpCode: .SELL, OrdprcPtnCode : "03")
//                    PushNotiService.init().showNotification(title: "SELL STOCKS : " + stocks.shcode, body: "SELL: " + String(sellQty) + "ea, total: " + String(newQty) + "ea")
//                }
//
//            }else{
//                return
//            }
//            break
//        }
    }
}
//
////MARK: - XingReceive
//extension TradeViewController {
//    override func onReceiveData(_ data: ReceiveData!) {
//        if let result = apiService.response_TR(data: data){
//            switch result.trCd {
//            case TR_TYPE_CD.t1102.rawValue:
//                if let nowPriceData = result as? RESULT_t1102 {
//                    responseT1102(resultData: nowPriceData)
//                }else{
//                    LAYOUT_COMMON.showAlert(title: "ALERT", msg: TR_TYPE_CD.t1102.rawValue + " DATA PARSE FAIL")
//                    
//                }
//                break
//            case TR_TYPE_CD.t0424.rawValue:
//                if let tmpHoldingList = result as? RESULT_t0424_LIST {
//                    
//                    for i in tmpHoldingList.t0424List {
//                        
//                    }
//                    
//                    holdingList = tmpHoldingList
//                    tvHodings.reloadData()
//                }else{
//                    LAYOUT_COMMON.showAlert(title: "ALERT", msg: TR_TYPE_CD.t0424.rawValue + " DATA PARSE FAIL")
//
//                }
//                break
//            default:
//                break
//            }
//        }
//    }
//    
//    override func onReleaseData(_ rqID: Int, code: String!) {
//        print("TradeViewController-onReleaseData" + String(rqID) + " " + code)
//    }
//    
//    override func onTimeOut(_ rqID: Int, code: String!) {
//        print("TradeViewController-onTimeOut")
//    }
//    
//    override func onReceiveRealData(_ bcCode: String!, key: String!, data: Data!) {
//        if let result = apiService.result_RealTime(type: bcCode, shcode: key, data: data){
//            switch result.bcCd {
//            case REALTIME_TYPE_CD.S3_.rawValue:
//                if let s3Info = result as? RESULT_S3_ {
////                    print(programInfo)
////                    RealtimeAnalysis.shared.setRealTimeResult(data: programInfo)
////                    setAnalysisInfo(resultData: programInfo)
//                    RealmService.shared().insertS3_(result: s3Info)
//                    
//                }else{
//                    LAYOUT_COMMON.showAlert(title: "ALERT", msg: REALTIME_TYPE_CD.S3_.rawValue + " DATA PARSE FAIL")
//                }
//                break
//                
//            case REALTIME_TYPE_CD.PH_.rawValue:
//                if let programInfo = result as? RESULT_PH_ {
//                    print(programInfo)
//                    RealtimeAnalysis.shared.setRealTimeResult(data: programInfo)
////                    setAnalysisInfo(resultData: programInfo)
//                    RealmService.shared().insertPH_(result: programInfo)
//                }else{
//                    LAYOUT_COMMON.showAlert(title: "ALERT", msg: REALTIME_TYPE_CD.PH_.rawValue + " DATA PARSE FAIL")
//                }
//                break
//                
//            case REALTIME_TYPE_CD.SC1.rawValue:
//                if let historyInfo = result as? RESULT_SC1 {
//                    RealtimeAnalysis.shared.setRealTimeResult(data: historyInfo)
//                    print(historyInfo)
////                    setAnalysisInfo(resultData: programInfo)
//                }else{
//                    LAYOUT_COMMON.showAlert(title: "ALERT", msg: REALTIME_TYPE_CD.SC1.rawValue + " DATA PARSE FAIL")
//                }
//                break
//            default:
//                break
//            }
//        }
//    }
//    
//    override func onRetryConnnect(_ count: Int) {
//        print("TradeViewController-onRetryConnnect " + String(count))
//    }
//    
//    override func onDisconnect() {
//        print("TradeViewController-onDisconnect")
//    }
//    
//    override func onReceiveMessage(_ msg: ReceiveMessage!) {
//        print("TradeViewController-onReceiveMessage " + msg.message)
//        
//    }
//    
//    override func onReceiveError(_ msg: ReceiveMessage!) {
//        print("TradeViewController-onReceiveError " + msg.message)
//    }
//}
