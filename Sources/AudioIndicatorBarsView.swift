//
//  AudioIndicatorBars.swift
//  AudioIndicatorBars
//
//  Created by Leonardo Cardoso on 16/09/2016.
//  Copyright © 2016 leocardz.com. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class AudioIndicatorBarsView: UIView {
    
    // MARK: - Lets
    static let barsOffset: CGFloat = 0.5
    
    // MARK: - Vars
    fileprivate var barsSet: [BarView] = []
    
    fileprivate var barCornerRadius: CGFloat = 0
    @IBInspectable var corner : CGFloat = 0 {
        didSet {
            barCornerRadius = corner
            barsSet.forEach { $0.layer.cornerRadius = corner }
        }
    }
    
    fileprivate var barsCount: Int = 4
    @IBInspectable var bars : CGFloat = 4 {
        didSet {
            barsCount = Int(bars)
            setupBarViews()
        }
    }
    
    
    fileprivate var barColor: UIColor = UIColor.black
    @IBInspectable var color : UIColor = UIColor.black {
        didSet {
            barColor = color
            barsSet.forEach { $0.backgroundColor = color }
        }
    }
    
    // MARK: - Initializers
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupBarViews()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBarViews()
    }
    
    // Custom initializers
    public init(
        _ rect: CGRect,
        _ barsCount: Int = 4,
        _ barCornerRadius: CGFloat = 0.0,
        _ color: UIColor = UIColor.black
        ) {
        self.barsCount = barsCount
        self.barCornerRadius = barCornerRadius
        self.barColor = color
        super.init(frame: rect)
        
        setupBarViews()
    }
    
    func setupBarViews() {
        // Remove all previous bars
        barsSet = []
        subviews.forEach { $0.removeFromSuperview() }
        
        // Add new
        let sectionsWidth = frame.width / CGFloat(barsCount)
        for i in 0 ..< barsCount {
            
            let x = sectionsWidth * CGFloat(i) + AudioIndicatorBarsView.barsOffset
            let width = sectionsWidth - AudioIndicatorBarsView.barsOffset * 2
            let y: CGFloat = self.frame.height - width
            
            let frame: CGRect = CGRect(x: x, y: y - AudioIndicatorBarsView.barsOffset, width: width, height: width)
            let bar: BarView = BarView(frame, barCornerRadius, barColor, x, width, self.frame.height)
            
            barsSet.append(bar)
            addSubview(bar)
        }
    }
    
    // Start animations
    open func start() {
        barsSet.forEach { $0.start() }
    }
    
    // Stop animations
    open func stop() {
        barsSet.forEach { $0.stop() }
    }
    
}
