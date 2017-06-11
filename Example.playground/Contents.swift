//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import AudioIndicatorBars

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
containerView.backgroundColor = UIColor.white
PlaygroundPage.current.liveView = containerView

let bars = AudioIndicatorBarsView(CGRect(x: 10, y: 10, width: 50, height: 50), 1, 0, UIColor.green)
containerView.addSubview(bars)
bars.backgroundColor = UIColor.clear
bars.tintColor = UIColor.red

bars.start()