//
//  Extention+UITableView.swift
//  TeamERP_DEMO
//
//  Created by Minh Thanh iOS on 7/27/17.
//  Copyright © 2017 thanhnm_dev91. All rights reserved.
//

import UIKit

public extension UITableView
{
    public func setIdentifier(_ identifier : String)
    {
        register(UINib.init(nibName: identifier , bundle: Bundle.main), forCellReuseIdentifier: identifier);
    }
    
    public func getIdentiferCell(_ identifier : String) -> UITableViewCell
    {
        return  dequeueReusableCell(withIdentifier: identifier)!
    }
}
