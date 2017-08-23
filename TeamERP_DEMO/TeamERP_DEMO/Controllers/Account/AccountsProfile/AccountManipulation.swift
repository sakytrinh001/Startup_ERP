//
//  AccountManipulation.swift
//  TeamERP_DEMO
//
//  Created by Minh Thanh iOS on 7/24/17.
//  Copyright © 2017 thanhnm_dev91. All rights reserved.
//

import UIKit

class AccountManipulation: MainControllers {

    
    @IBOutlet weak var login: LoginVC!
    @IBOutlet weak var register: RegisterVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        login.isHidden = false
        register.isHidden = true
    }
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true) { 
            return
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentSwitch(_ sender: Any) {
        let segmentedControl = sender as! UISegmentedControl
        let selectedSegment = segmentedControl.selectedSegmentIndex
        if selectedSegment == 0 {
            login.isHidden = false
            register.isHidden = true
            return
        }
        login.isHidden = true
        register.isHidden = false
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
