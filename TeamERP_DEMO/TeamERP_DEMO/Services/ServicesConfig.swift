//
//  ServicesConfig.swift
//  Hey_Go
//
//  Created by Lê Dũng on 5/19/17.
//  Copyright © 2017 NCSoft. All rights reserved.
//

import UIKit
let  servicesConfig = ServicesConfig.sharedInstance()


enum ServicesType : String
{
    
    case services = "http://112.78.1.22:8000"
}


class ServicesConfig: NSObject {
    static var instance: ServicesConfig!
    class func sharedInstance() -> ServicesConfig
    {
        if(self.instance == nil)
        {
            self.instance = (self.instance ?? ServicesConfig())
        }
        return self.instance
    }
}
