//
//  TabmanBar+BackgroundView.swift
//  Tabman
//
//  Created by Merrick Sapsford on 22/02/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import UIKit
import PureLayout

public extension TabmanBar {
 
    /// View that displays background styles for a TabmanBar.
    public class BackgroundView: UIView {
        
        //
        // MARK: Types
        //
        
        public enum BackgroundStyle {
            case clear
            case blur(style: UIBlurEffectStyle)
            case solid(color: UIColor)
        }
        
        //
        // MARK: Properties
        //
        
        var backgroundStyle: BackgroundStyle = TabmanBar.Appearance.defaultAppearance.style.background ?? .clear {
            didSet {
                self.updateBackground(forStyle: backgroundStyle)
            }
        }
        
        private var backgroundContainer = UIView()
        
        //
        // MARK: Init
        //
        
        public override init(frame: CGRect) {
            super.init(frame: frame)
            initBackgroundView()
        }
        
        required public init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            initBackgroundView()
        }
        
        private func initBackgroundView() {
            self.addSubview(self.backgroundContainer)
            self.backgroundContainer.autoPinEdgesToSuperviewEdges()
            
            self.updateBackground(forStyle: backgroundStyle)
        }
        
        //
        // MARK: Lifecycle
        //
        
        func updateBackground(forStyle style: BackgroundStyle) {
            self.backgroundContainer.removeAllSubviews()
            
            switch style {
                
            case .blur(let style):
                let blurView = UIVisualEffectView(effect: UIBlurEffect(style: style))
                self.backgroundContainer.addSubview(blurView)
                blurView.autoPinEdgesToSuperviewEdges()
                
            case .solid(let color):
                let colorView = UIView()
                colorView.backgroundColor = color
                self.backgroundContainer.addSubview(colorView)
                colorView.autoPinEdgesToSuperviewEdges()
                
            default:()
            }
        }
    }
}

extension TabmanBar.BackgroundView.BackgroundStyle: CustomStringConvertible, Equatable {
    
    public var description: String {
        switch self {
        case .blur(let style):
            return "blur\(style.rawValue)"
            
        case .solid(let color):
            return "color\(color.hashValue)"
            
        default:
            return "none"
        }
    }
    
    public static func ==(lhs: TabmanBar.BackgroundView.BackgroundStyle,
                          rhs: TabmanBar.BackgroundView.BackgroundStyle) -> Bool {
        return lhs.description == rhs.description
    }
}
