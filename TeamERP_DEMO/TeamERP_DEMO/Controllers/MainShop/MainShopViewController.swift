//
//  MainShopViewController.swift
//  TeamERP_DEMO
//
//  Created by Minh Thanh iOS on 7/27/17.
//  Copyright © 2017 thanhnm_dev91. All rights reserved.
//

import UIKit

class MainShopViewController: MainControllers, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tbViewShop: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tbViewShop.setIdentifier("MainShopCell")
        tbViewShop.rowHeight = UITableViewAutomaticDimension
        tbViewShop.estimatedRowHeight = 200
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.getIdentiferCell("MainShopCell") as! MainShopCell
        cell.textLabel?.text = "Dự án đầu tay"
        return cell
        
    }

}
