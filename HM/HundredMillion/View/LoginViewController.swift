//
//  ViewController.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/11/13.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import UIKit
import XingAPIMobile

extension LoginViewController: SharedDataSyncProtocol {
    func syncData(dataType : String) {
        if dataType == CMN_DATA_TYPE_CD.LOGIN_MSG.rawValue {
            lblLoginResult.text = SharedDataModel.shared.loginMsg
        }
    }
}

class LoginViewController: UIViewController{
    @IBOutlet weak var lblLoginResult: UILabel!
    @IBOutlet weak var sgAutoLoginFlag: UISegmentedControl!
    @IBOutlet weak var sgServerTypeFlag: UISegmentedControl!
    let UD = UserDefaults.standard
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sgAutoLoginFlag.selectedSegmentIndex = UD.integer(forKey: USER_DEFAULT_CD.AUTO_LOGIN)
        sgServerTypeFlag.selectedSegmentIndex = UD.integer(forKey: USER_DEFAULT_CD.IS_REAL)
        
        if sgAutoLoginFlag.selectedSegmentIndex == 1{
            if UD.bool(forKey: USER_DEFAULT_CD.IS_REAL){
                StocksAPI.shared.login(serverType: .API_SERVER)
            }else{
                StocksAPI.shared.login(serverType: .MOTU_SERVER)
            }
        }
    }
    
    //MARK: - Functions
    
    //MARK: - IBAction
    @IBAction func setSegmentValue(_ sender: UISegmentedControl) {
        if sender.tag == 11{
            UD.set(sender.selectedSegmentIndex, forKey: USER_DEFAULT_CD.AUTO_LOGIN)
        }else if sender.tag == 22{
            UD.set(sender.selectedSegmentIndex, forKey: USER_DEFAULT_CD.IS_REAL)
        }
        
    }
    
    @IBAction func touchLogin(_ sender: Any) {
        if UD.bool(forKey: USER_DEFAULT_CD.IS_REAL){
            StocksAPI.shared.login(serverType: .API_SERVER)
        }else{
            StocksAPI.shared.login(serverType: .MOTU_SERVER)
        }
    }
}
