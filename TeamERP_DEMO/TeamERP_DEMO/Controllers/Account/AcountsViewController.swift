//
//  AcountsViewController.swift
//  TeamERP_DEMO
//
//  Created by Minh Thanh iOS on 7/24/17.
//  Copyright © 2017 thanhnm_dev91. All rights reserved.
//

import UIKit
import PGTabBar

class AcountsViewController: MainControllers, TabContainerDelegate {

    var account = AccountManipulation()
    var login = LoginVC()
    var register = RegisterVC()
    
    @IBOutlet weak var TabbarTop: TabContainer!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        TabbarTop.indicator = TabIndicator()
        TabbarTop.option.bounces = false
        TabbarTop.delegate = self
        //        tabContainer.option.interItemSpacing = 3
        //        tabContainer.option.lineSpacing = 1
        
        TabbarTop.option.aspect = .fitable
        TabbarTop.option.alignment = .center
        
        var tabList = [TabItem]()
        
        tabList.append(TabItem(title: TabText.title("Đăng nhập").boldFont(size: 18).attrText,
                               selectedTitle: TabText.title("Đăng nhập").boldFont(size: 18).color(.white).attrText,
                               cellClazz: TabCell.self ))
        tabList.append(TabItem(title: TabText.title("Đăng ký").boldFont(size: 18).attrText,
                               selectedTitle: TabText.title("Đăng ký").boldFont(size: 18).color(.white).attrText,
                               cellClazz: TabCell.self ))
        TabbarTop.tabList = tabList
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        register.frame = CGRect.init(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(register)
        register.isHidden = true
        
        login.frame = CGRect.init(x: 0, y: 64, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(login)
        login.isHidden = true
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.TabbarTop.setNeedsUpdateConstraints()
    }
    
    
    func indexWithTabContainer(_ container:TabContainer) -> NSInteger? {
        return 0
    }
    
    func didSelectedTabContainer(_ container:TabContainer, index:NSInteger, item:TabItemProtocol, tabCell:TabCellProtocol) {
//        register.isHidden = true
//        login.isHidden = false
    }
    
    func didDeselectedTabContainer(_ container:TabContainer, index:NSInteger, item:TabItemProtocol, tabCell:TabCellProtocol) {
//        register.isHidden = false
//        login.isHidden = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
