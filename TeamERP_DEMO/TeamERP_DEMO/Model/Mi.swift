//
//  Mi.swift
//  TeamERP_DEMO
//
//  Created by Minh Thanh iOS on 7/24/17.
//  Copyright © 2017 thanhnm_dev91. All rights reserved.
//

//
//  Mi.swift
//  GProject
//
//  Created by KieuVan & LeHuuDung on 3/24/17.
//  Copyright © 2017 KieuVan. All rights reserved.
//

import UIKit
open class Mi: NSObject
{
    public override init()
    {
        super.init()
    }
    public init(dictionary : NSDictionary)
    {
        super.init()
        var allKey = self.propertyNames()
        for  i in 0..<allKey.count
        {
            let key = allKey[i]
            
            print("key : \(key)")
            
            if(dictionary[key] != nil)
            {
                if let value = dictionary[key]
                {
                    if(!(value  is NSNull))
                    {
                        self.setValue(value , forKey: key )
                    }
                }
            }
        }
    }
    
    public func dictionary() ->Dictionary<String,Any >
    {
        var dict = Dictionary<String, Any>()
        let allKey = propertyNames()
        for  i in 0..<allKey.count
        {
            dict[allKey[i]] = value(forKey: allKey[i])
        }
        return dict;
    }
}

public extension Mi
{
    public func propertyNames() -> [String]
    {
        return Mirror(reflecting: self).children.flatMap { $0.label }
    }
}


