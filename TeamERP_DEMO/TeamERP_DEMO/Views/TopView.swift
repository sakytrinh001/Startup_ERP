//
//  TopView.swift
//  TeamERP_DEMO
//
//  Created by Minh Thanh iOS on 7/20/17.
//  Copyright © 2017 thanhnm_dev91. All rights reserved.
//

import UIKit

class TopView: NCBaseView {

    @IBOutlet weak var btBackNav: UIButton!
    @IBOutlet weak var lbTitle: UILabel!
    var completion : ((Int)->Void)!
    
    override func initStyle()
    {
        
    }
    @IBAction func backNav(_ sender: Any) {
        completion(0)
    }
    
    func target(handle : @escaping ((Int)->Void))
    {
        completion = handle
    }
    
    func set(_ title: String, isHideBtBack: Bool){
        lbTitle.text = title
        self.btBackNav.isHidden = isHideBtBack
    }
    
}
