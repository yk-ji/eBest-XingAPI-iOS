//
//  HoldingCell.swift
//  HundredMillion
//
//  Created by youngkwanji on 2020/12/08.
//  Copyright © 2020 youngkwanji. All rights reserved.
//

import UIKit

class HoldingCell: UITableViewCell {

    @IBOutlet weak var lblHname: UILabel!
    @IBOutlet weak var lblShcode: UILabel!
    @IBOutlet weak var lblJanqty: UILabel!
    @IBOutlet weak var lblPamt: UILabel!
    @IBOutlet weak var lblMamt: UILabel!
    @IBOutlet weak var lblDtsunik: UILabel!
    @IBOutlet weak var lblSunikrt: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setHoldingInfo(info: RESULT_t0424){
        lblHname.text = info.hname
        lblShcode.text = info.shcode
        lblJanqty.text = "수량: " + info.janqty + "주"
//        lblPamt.text = "평단: " + FUNC_COMMON.convertDecimalPrice(price: info.pamt)
//        lblMamt.text = "총액: " + FUNC_COMMON.convertDecimalPrice(price: info.mamt)
//        lblDtsunik.text = "손익: " + FUNC_COMMON.convertDecimalPrice(price: info.dtsunik)
//        lblSunikrt.text = "수익률: " + info.sunikrt + "%"
//        lblPrice.text = "현재가: " + FUNC_COMMON.convertDecimalPrice(price: info.price)
        
        setTextColor(info: info)
    }
    
    
    private func setTextColor(info: RESULT_t0424){
        if (info.dtsunik as NSString).floatValue > 0 {
            lblDtsunik.textColor = .red
        }else if (info.dtsunik as NSString).floatValue < 0 {
            lblDtsunik.textColor = .blue
        }else{
            lblDtsunik.textColor = .black
        }
        
        if (info.sunikrt as NSString).floatValue > 0 {
            lblSunikrt.textColor = .red
        }else if (info.sunikrt as NSString).floatValue < 0 {
            lblSunikrt.textColor = .blue
        }else{
            lblSunikrt.textColor = .black
        }
    }
    
}
