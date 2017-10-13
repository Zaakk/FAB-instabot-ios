//
//  FAButton.swift
//  FAB
//
//  Created by Zakatnov's on 11.10.17.
//  Copyright © 2017 Alexander Zakatnov. All rights reserved.
//

import Foundation
import UIKit

enum FABPosition: NSInteger {
    case RightBottom
    case LeftBottom
    case RightTop
    case LeftTop
}

let kDefaultPaddingForButton:CGFloat = 15.0
let kFABTapEventName = "FABTapped"

fileprivate var isItAlreadyOnWindow:Bool = false

class FAButton: UIButton {
    
    internal var width: CGFloat = 25.0
    internal var draggable: Bool = true
    internal var position:FABPosition = .RightBottom
    
    private var buttonCenter = CGPoint.zero
    
    init(width:CGFloat = 25.0, position:FABPosition = .RightBottom, draggable:Bool = true) {
        super.init(frame: generateFrame(position: position, width: width))
        self.backgroundColor = UIColor.red
        self.frame = generateFrame(position: position, width: width)
        self.width = width
        self.draggable = draggable
        self.position = position
        
        configureView()
        
        self.addTarget(self, action: #selector(self.tap), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureView() {
        self.setTitle("I", for: .normal)
        self.layer.cornerRadius = self.width / 2.0
        if self.draggable {
            let pan = UIPanGestureRecognizer(target: self, action: #selector(self.panButton(pan:)))
            self.addGestureRecognizer(pan)
        }
    }
    
    @objc private func tap() {
        NotificationCenter.default.post(name: Notification.Name(kFABTapEventName), object: self)
    }
    
    @objc private func panButton(pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began:
            buttonCenter = self.center
        case .changed:
            let location = pan.location(in: self.superview)
            if  checkBounds(for: location) {
                self.center = location
            }
        default:
            break
        }
    }
    
    private func checkBounds(for location:CGPoint) -> Bool {
        let screenSize:CGSize = UIScreen.main.bounds.size
        return  location.x + self.width / 2.0 < screenSize.width &&
                location.y + self.width / 2.0 < screenSize.height &&
                location.x - self.width / 2.0 > 0 &&
                location.y - self.width / 2.0 > 0
    }
    
    static func addToWindow(width:CGFloat = 25.0, position:FABPosition = .RightBottom, draggable:Bool = true) {
        guard isItAlreadyOnWindow == false else {
            return
        }
        isItAlreadyOnWindow = true
        let btn = FAButton(width: width, position: position, draggable: draggable)
        UIApplication.shared.keyWindow?.addSubview(btn)
    }
    
    func generateFrame(position:FABPosition, width:CGFloat) -> CGRect {
        let screenSize = UIScreen.main.bounds
        var x:CGFloat = 0.0
        var y:CGFloat = 0.0
        switch position {
        case .RightBottom:
            x = screenSize.width - width - kDefaultPaddingForButton
            y = screenSize.height - width - kDefaultPaddingForButton
        case .LeftBottom:
            x = kDefaultPaddingForButton
            y = screenSize.height - width - kDefaultPaddingForButton
        case .RightTop:
            x = screenSize.width - width - kDefaultPaddingForButton
            y = kDefaultPaddingForButton
        case .LeftTop:
            x = kDefaultPaddingForButton
            y = kDefaultPaddingForButton
        }
        
        return CGRect(x: x, y: y, width: width, height: width)
    }
    
}
