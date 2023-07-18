//
//  CustomDarkTheme.swift
//  HundredMillion
//
//  Created by youngkwanji on 2021/02/20.
//  Copyright © 2021 youngkwanji. All rights reserved.
//

import Foundation
import UIKit

enum HEX_COLOR_KEY: String {
    case DARK_NAVY_VIEW = "040814"
    case NAVI_VIEW = "121420"
    case RED_VIEW = "F4265C"
    case WHITE_TEXT = "E6E7ED"
    case DARK_GARY_TEXT = "555763"
}

class DK_NavyView : UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomColor()
    }
    
    private func setCustomColor(){
        self.backgroundColor = UIColor.init(hex: HEX_COLOR_KEY.NAVI_VIEW.rawValue)
    }
}

class DK_DarkNavyView : UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomColor()
    }
    
    private func setCustomColor(){
        self.backgroundColor = UIColor.init(hex: HEX_COLOR_KEY.DARK_NAVY_VIEW.rawValue)
    }
}


class DK_RedButton : UIButton {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomColor()
    }
    
    private func setCustomColor(){
        self.backgroundColor = UIColor.init(hex: HEX_COLOR_KEY.RED_VIEW.rawValue)
        self.setTitleColor(UIColor.init(hex: HEX_COLOR_KEY.WHITE_TEXT.rawValue), for: .normal)
    }
}

class DK_DarkGrayLabel : UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomColor()
    }
    
    private func setCustomColor(){
        self.textColor = UIColor.init(hex: HEX_COLOR_KEY.DARK_GARY_TEXT.rawValue)
    }
}

class DK_WhiteLabel : UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomColor()
    }
    
    private func setCustomColor(){
        self.textColor = UIColor.init(hex: HEX_COLOR_KEY.WHITE_TEXT.rawValue)
    }
}

class DK_RedSegement : UISegmentedControl {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomColor()
    }
    
    private func setCustomColor(){
//        self.backgroundColor = .clear
//        self.layer.borderWidth = 0.5
//        self.layer.borderColor = UIColor.init(hex: HEX_COLOR_KEY.WHITE_TEXT.rawValue).cgColor
        self.backgroundColor = UIColor.init(hex: HEX_COLOR_KEY.NAVI_VIEW.rawValue)
        self.selectedSegmentTintColor = UIColor.init(hex: HEX_COLOR_KEY.RED_VIEW.rawValue)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.init(hex:HEX_COLOR_KEY.WHITE_TEXT.rawValue)], for: .selected)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.init(hex:HEX_COLOR_KEY.DARK_GARY_TEXT.rawValue)], for: .normal)
    }
}
