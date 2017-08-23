//
//  AppDelegate.swift
//  TeamERP_DEMO
//
//  Created by Minh Thanh iOS on 7/20/17.
//  Copyright © 2017 thanhnm_dev91. All rights reserved.
//

import UIKit
import MBProgressHUD


let app = UIApplication.shared.delegate as! AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var HUD:MBProgressHUD?
    var popupCustom : PopupNotifi?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    //MARK - Show HUD
    func showHUD(strTitle:String){
        weak var weakself = self
        DispatchQueue.main.async {
            if (weakself?.HUD == nil) {
                weakself?.HUD = MBProgressHUD.showAdded(to: (weakself?.window)!, animated: true)
                weakself?.HUD?.label.text = strTitle
            }
        }
    }
    
    func closeHUD(){
        weak var weakself = self
        DispatchQueue.main.async {
            weakself?.HUD?.isHidden = true
            weakself?.HUD = nil
            weakself?.HUD?.removeFromSuperview()
        }
    }

    
    //MARK - Show Message
    func showMessageBoxInfoPopup(strTitle:String,strContent:String,strImg:String, strBgImg: String, strTitleButton:String,completionHandler: @escaping () -> ()){
        weak var weakself = self
        
        DispatchQueue.main.async {
            if weakself?.popupCustom != nil {
                weakself?.popupCustom?.removeFromSuperview()
                weakself?.popupCustom = nil
            }
            weakself?.popupCustom = PopupNotifi.instanceFromNib() as? PopupNotifi
            weakself?.popupCustom?.lbTitlePopup.text = strTitle
            weakself?.popupCustom?.lbDetailPopup.text = strContent
            weakself?.popupCustom?.iconPopup.image = UIImage(named: strImg)
            weakself?.popupCustom?.bgImgPopup.image = UIImage(named: strBgImg)
            weakself?.popupCustom?.viewContainsBt.isHidden = true
            weakself?.popupCustom?.btPopup.isHidden = false
            
            if strTitleButton != ""{
                weakself?.popupCustom?.btPopup.setTitle(strTitleButton, for: UIControlState.normal)
            }
            weakself?.popupCustom?.frame = (weakself?.window?.bounds)!
            weakself?.window?.addSubview((weakself?.popupCustom)!)
            weakself?.popupCustom?.btActionPopup = {
                completionHandler()
            }
        }
    }
    
    
    
    func showMessageBoxPopupTwoBt(strTitle:String,strContent:String,strIcon: String,strBg: String ,strTitleButtonOk:String,strTitleButtonCancel:String,completionHandler: @escaping () -> (), completionHandlerCancel: @escaping () -> ()){
        weak var weakself = self
        
        DispatchQueue.main.async {
            if weakself?.popupCustom != nil {
                weakself?.popupCustom?.removeFromSuperview()
                weakself?.popupCustom = nil
            }
            weakself?.popupCustom = PopupNotifi.instanceFromNib() as? PopupNotifi
            weakself?.popupCustom?.lbTitlePopup.text = strTitle
            weakself?.popupCustom?.lbDetailPopup.text = strContent
            weakself?.popupCustom?.viewContainsBt.isHidden = false
            weakself?.popupCustom?.btPopup.isHidden = true
            weakself?.popupCustom?.iconPopup.image = UIImage(named: strIcon)
            weakself?.popupCustom?.bgImgPopup.image = UIImage(named: strBg)
            
            if strTitleButtonOk != ""{
                weakself?.popupCustom?.btTryAgain.setTitle(strTitleButtonOk, for: UIControlState.normal)
            }
            
            if strTitleButtonCancel != ""{
                weakself?.popupCustom?.btCancel.setTitle(strTitleButtonCancel, for: UIControlState.normal)
            }
            
            weakself?.popupCustom?.frame = (weakself?.window?.bounds)!
            weakself?.window?.addSubview((weakself?.popupCustom)!)
            weakself?.popupCustom?.btActionTryAgain = {
                completionHandler()
            }
            
            weakself?.popupCustom?.btActionCancel = {
                completionHandlerCancel()
            }
        }
    }
}

