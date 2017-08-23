//
//  RegisterVC.swift
//  TeamERP_DEMO
//
//  Created by Minh Thanh iOS on 7/20/17.
//  Copyright © 2017 thanhnm_dev91. All rights reserved.
//

import UIKit
import DTTextField

class RegisterVC: ViewButton {
    @IBOutlet weak var tfPassUser: DTTextField!
    @IBOutlet weak var tfUserName: DTTextField!
    @IBOutlet weak var tfConfirmPass: DTTextField!
    let userNameMessage        = "Tên là bắt buộc."
    let pass1Message        = "Mật khẩu là bắt buộc."
    
    
    @IBOutlet weak var btRegister: UIButton!
    @IBOutlet weak var tfEmailRegister: DTTextField!
    override func initStyle() {
        
    }
   
    @IBAction func registerAccount(_ sender: Any) {
        if !(tfUserName.text?.isEmpty)! && !(tfPassUser.text?.isEmpty)! && !(tfConfirmPass.text?.isEmpty)! && !(tfEmailRegister.text?.isEmpty)!{
            postRegister()
        }else{
            if (tfUserName.text?.isEmpty)! || (tfPassUser.text?.isEmpty)! || (tfConfirmPass.text?.isEmpty)! || (tfEmailRegister.text?.isEmpty)!{
                app.showMessageBoxInfoPopup(strTitle: KeyObject.kTitleNotifi, strContent: "Nhập đầy đủ thông tin, để đăng ký.", strImg: KeyObject.kIconNotifi, strBgImg: KeyObject.kBgNotifi, strTitleButton: KeyObject.kOK, completionHandler: {
                    return
                })
                return
            }
            if !isValidEmail(testStr: tfEmailRegister.text!) {
                app.showMessageBoxInfoPopup(strTitle: KeyObject.kTitleNotifi, strContent: "Email không đúng.", strImg: KeyObject.kIconNotifi, strBgImg: KeyObject.kBgNotifi, strTitleButton: KeyObject.kOK, completionHandler: {
                    return
                })
                return
            }
            
            if tfPassUser.text != tfConfirmPass.text {
                app.showMessageBoxInfoPopup(strTitle: KeyObject.kTitleNotifi, strContent: "Mật khẩu không giống nhau.", strImg: KeyObject.kIconNotifi, strBgImg: KeyObject.kBgNotifi, strTitleButton: KeyObject.kOK, completionHandler: {
                    return
                })
                return
            }
        }
    }
    
    
    func postRegister() {
        let request = RegisterModel_Request()
        request.username = "Thanh"
        request.password = "123456"
        request.email = "Thanh91pro@gmail.com"
        app.showHUD(strTitle: "Đang xử lý...")
        ERequest.registerPost(request: request, success: { (data) in
            app.showMessageBoxInfoPopup(strTitle: KeyObject.kTitleNotifi, strContent: "Đăng ký thành công.", strImg: KeyObject.kIconNotifi, strBgImg: KeyObject.kBgNotifi, strTitleButton: KeyObject.kOK, completionHandler: {
                return
            })
            app.closeHUD()
        }) { (err) in
            app.showMessageBoxInfoPopup(strTitle: KeyObject.kTitleNotifi, strContent: err, strImg: KeyObject.kIconNotifi, strBgImg: KeyObject.kBgNotifi, strTitleButton: KeyObject.kOK, completionHandler: {
                return
            })
            app.closeHUD()
        }
    }
    
    func validateData() -> Bool {
        
        guard !tfUserName.text!.isEmptyStr else {
            tfUserName.showError(message: userNameMessage)
            return false
        }
        
        guard !tfPassUser.text!.isEmptyStr else {
            tfPassUser.showError(message: pass1Message)
            return false
        }
        
        guard !tfConfirmPass.text!.isEmptyStr else {
            tfConfirmPass.showError(message: pass1Message)
            return false
        }
        
        
        return true
    }

}
