//
//  PopupNotifi.swift
//  TeamERP_DEMO
//
//  Created by Minh Thanh iOS on 7/25/17.
//  Copyright © 2017 thanhnm_dev91. All rights reserved.
//

import UIKit

import UIKit

class PopupNotifi: ViewMains {
    
    @IBOutlet weak var lbTitlePopup: UILabel!
    @IBOutlet weak var iconPopup: UIImageView!
    @IBOutlet weak var lbDetailPopup: UILabel!
    @IBOutlet weak var btPopup: UIButton!
    @IBOutlet weak var viewContainsPopup: UIView!
    
    @IBOutlet weak var bgImgPopup: UIImageView!
    @IBOutlet weak var viewContainsBt: UIView!
    @IBOutlet weak var btCancel: UIButton!
    @IBOutlet weak var btTryAgain: UIButton!
    
    var btActionPopup: (() -> ())?
    var btActionTryAgain: (() -> ())?
    var btActionCancel: (() -> ())?
    
    override func awakeFromNib() {
        viewContainsPopup.layer.cornerRadius = 4.0
        viewContainsPopup.layer.masksToBounds = true
        
        btCancel.layer.cornerRadius = 4.0
        btCancel.layer.masksToBounds = true
        
        btTryAgain.layer.cornerRadius = 4.0
        btTryAgain.layer.masksToBounds = true
        
        btPopup.layer.cornerRadius = 4.0
        btPopup.layer.masksToBounds = true
        
        iconPopup.layer.shadowColor = UIColor.gray.cgColor
        iconPopup.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        iconPopup.layer.shadowOpacity = 0.3
        iconPopup.layer.shadowRadius = 1.0
        iconPopup.layer.masksToBounds = false
        iconPopup.clipsToBounds = false
        
    }
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "PopupNotifi", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    @IBAction func btActionPopup(_ sender: Any) {
        self.removeFromSuperview()
        if btActionPopup != nil {
            self.btActionPopup!()
        }
        
    }
    @IBAction func btActionTryAgain(_ sender: Any) {
        self.removeFromSuperview()
        if btActionTryAgain != nil {
            self.btActionTryAgain!()
        }
    }
    @IBAction func btActionCancel(_ sender: Any) {
        self.removeFromSuperview()
        if btActionCancel != nil {
            self.btActionCancel!()
        }
    }
}

