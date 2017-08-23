//
//  TabContainerDelegate.swift
//  Pods
//
//  Created by ipagong on 2017. 4. 28..
//
//

import Foundation



//-------------------------------------//
// MARK: - TabContainerDelegate
//-------------------------------------//

public protocol TabContainerDelegate : class {
    
    func indexWithTabContainer(_ container:TabContainer) -> NSInteger?
    
    func didLoadTabContainer(_ container:TabContainer, tabCount:NSInteger)
    
    func didSelectedTabContainer(_ container:TabContainer, index:NSInteger, item:TabItemProtocol, tabCell:TabCellProtocol)

    func didDeselectedTabContainer(_ container:TabContainer, index:NSInteger, item:TabItemProtocol, tabCell:TabCellProtocol)
    
}


extension TabContainerDelegate {
    
    public func indexWithTabContainer(_ container:TabContainer) -> NSInteger? { return nil }
    
    public func didLoadTabContainer(_ container:TabContainer, tabCount:NSInteger) { }
    
    public func didSelectedTabContainer(_ container:TabContainer, index:NSInteger, item:TabItemProtocol, tabCell:TabCellProtocol) { }
    
    public func didDeselectedTabContainer(_ container:TabContainer, index:NSInteger, item:TabItemProtocol, tabCell:TabCellProtocol)  { }
    
}

