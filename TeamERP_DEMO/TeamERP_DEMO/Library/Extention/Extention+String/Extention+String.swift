//
//  Extention+String.swift
//  TeamERP_DEMO
//
//  Created by Minh Thanh iOS on 7/28/17.
//  Copyright © 2017 thanhnm_dev91. All rights reserved.
//

import UIKit

public extension String
{
    
    public func hexColor() -> UIColor {
        let hexint = Int(intFromHexString(self))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        return color
    }
    
    fileprivate func intFromHexString(_ hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        let scanner: Scanner = Scanner(string: hexStr)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }

}
