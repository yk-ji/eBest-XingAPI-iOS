//
//  AnalysisViewController.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/13.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import Foundation
import UIKit
import XingAPIMobile
import GoogleSignIn

class AnalysisViewController: UIViewController {
    @IBOutlet weak var sgAutoFlag: UISegmentedControl!
    @IBOutlet weak var lblKospi: UILabel!
    @IBOutlet weak var tvRealmDB: UITableView!
    @IBOutlet weak var tvCSV: UITableView!
    var realmDBList : [String] = []
    var csvList : [String] = []
    
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        tvRealmDB.delegate = self
//        tvRealmDB.dataSource = self
//        tvCSV.delegate = self
//        tvCSV.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.parent?.title = "Analysis"
        getFileList(fileType: "realm")
        getFileList(fileType: "csv")
        tvRealmDB.reloadData()
        tvCSV.reloadData()
    }

    //MARK: - Functions
    func getFileList(fileType: String){
        if fileType == "realm"{
            realmDBList = []
        }else if fileType == "csv"{
            csvList = []
        }else{
            return
        }
        
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
            // process files
            for f in fileURLs {
                let fileExtenstion = URL(fileURLWithPath: f.absoluteString).pathExtension
                let fileName = URL(fileURLWithPath: f.absoluteString).deletingPathExtension().lastPathComponent
            
                if fileExtenstion == "realm" && fileType == "realm"{
                    realmDBList.append(fileName)
                }else if fileExtenstion == "csv" && fileType == "csv"{
                    csvList.append(fileName)
                }
            }
        } catch {
            print("Error while enumerating files \(documentsURL.path): \(error.localizedDescription)")
        }
    }
    
    
    func convertRealmToCSV(fileName: String){
        let documentsURL = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .userDomainMask, true)[0]
        
        
        let fileURL = documentsURL + "/" + fileName + ".realm"
        let saveURL = documentsURL + "/" + fileName
        
        print(fileURL)
        
        DispatchQueue.global().async {
            do {
                let exporter = try CSVDataExporter.init(realmFilePath: fileURL)
                try exporter.export(toFolderAtPath: saveURL)
            } catch {
                print(error)
            }
            DispatchQueue.main.async {
                self.getFileList(fileType: "csv")
                self.tvCSV.reloadData()
            }
        }
        
        print(fileName)
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
//extension AnalysisViewController : UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if tableView == tvRealmDB {
//            return realmDBList.count
//        }else if tableView == tvCSV {
//            return csvList.count
//        }else{
//            return 0
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let reuseString = "FileInfoCell"
//        var cell : FileInfoCell!
//        
//        cell = tableView.dequeueReusableCell(withIdentifier: reuseString) as? FileInfoCell
//        
//        if cell == nil {
//            tableView.register(UINib.init(nibName: reuseString, bundle: nil), forCellReuseIdentifier: reuseString)
//            cell = tableView.dequeueReusableCell(withIdentifier: reuseString) as? FileInfoCell
//        }
//        
//        cell.selectionStyle = .none
//        if tableView == tvRealmDB {
//            cell.lblFileName.text = realmDBList[indexPath.row]
//            return cell
//        }else if tableView == tvCSV {
//            cell.lblFileName.text = csvList[indexPath.row]
//            return cell
//        }else{
//            return UITableViewCell()
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if tableView == tvRealmDB {
//            return "DB LIST"
//        }else if tableView == tvCSV {
//            return "CSV LIST"
//        }else{
//            return ""
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        if tableView == tvRealmDB {
//            let action = UIContextualAction.init(style: .normal, title: "toCSV") { (action, view, success) in
//                
//                    let fileName = self.realmDBList[indexPath.row]
//                    self.convertRealmToCSV(fileName: fileName)
//                
//            }
//            
//            action.backgroundColor = .blue
//            return UISwipeActionsConfiguration.init(actions: [action])
//        }
//        
//        return nil
//    }
//    
//}
//
//
////MARK: - XingReceive
//extension AnalysisViewController {
//    override func onReceiveData(_ data: ReceiveData!) {
//        //        if let result = apiService.response_TR(data: data){
//        //            switch result.trCd {
//        //            case RES_TYPE_CD.CSPAQ22200.rawValue:
//        //                if let accountData = result as? RESULT_CSPAQ22200 {
//        //                    setAccountDetailInfo(resultData: accountData)
//        //                }else{
//        //                    LAYOUT_COMMON.showAlert(title: "ALERT", msg: RES_TYPE_CD.CSPAQ22200.rawValue + " DATA PARSE FAIL")
//        //                }
//        //                break
//        //            default:
//        //                break
//        //            }
//        //        }
//    }
//    
//    override func onReleaseData(_ rqID: Int, code: String!) {
//        print("AnalysisViewController-onReleaseData" + String(rqID) + " " + code)
//    }
//    
//    override func onTimeOut(_ rqID: Int, code: String!) {
//        print("AnalysisViewController-onTimeOut")
//    }
//    
//    override func onReceiveRealData(_ bcCode: String!, key: String!, data: Data!) {
//        print("AnalysisViewController-onReceiveRealData")
//    }
//    
//    override func onRetryConnnect(_ count: Int) {
//        print("AnalysisViewController-onRetryConnnect " + String(count))
//    }
//    
//    override func onDisconnect() {
//        print("AnalysisViewController-onDisconnect")
//    }
//    
//    override func onReceiveMessage(_ msg: ReceiveMessage!) {
//        print("AnalysisViewController-onReceiveMessage " + msg.message)
//        
//    }
//    
//    override func onReceiveError(_ msg: ReceiveMessage!) {
//        print("AnalysisViewController-onReceiveError " + msg.message)
//    }
//}
