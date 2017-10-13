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
    case rightBottom, leftBottom, rightTop, leftTop
}

enum FABState: NSInteger {
    case loading, normal
}

let kDefaultPaddingForButton:CGFloat = 15.0
let kFABTapEventName = "FABTapped"

class FAButton: UIButton {
    
    fileprivate static var isItAlreadyOnWindow:Bool = false
    
    internal var width: CGFloat = 25.0
    internal var draggable: Bool = true
    internal var position:FABPosition = .rightBottom
    internal var loadingIndicator:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
    
    private var buttonCenter = CGPoint.zero
    
    var buttonState:FABState = .normal {
        didSet {
            if buttonState == .normal {
                loadingIndicator.stopAnimating()
                titleLabel?.alpha = 1
            } else {
                loadingIndicator.startAnimating()
                titleLabel?.alpha = 0
            }
        }
    }
    
    /// Instantiates and adds button on root window.
    ///
    /// - Parameters:
    ///   - width: size of square button
    ///   - position: start position on screen
    ///   - draggable: enable/disable drag&drop
    static func addOnWindow(width:CGFloat = 25.0, position:FABPosition = .rightBottom, draggable:Bool = true) {
        guard isItAlreadyOnWindow == false else {
            return
        }
        isItAlreadyOnWindow = true
        let btn = FAButton(width: width, position: position, draggable: draggable)
        UIApplication.shared.keyWindow?.addSubview(btn)
    }
    
    init(width:CGFloat = 25.0, position:FABPosition = .rightBottom, draggable:Bool = true) {
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
        loadingIndicator.center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        loadingIndicator.isHidden = true
        loadingIndicator.hidesWhenStopped = true
        self.addSubview(loadingIndicator)
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
            if checkBounds(for: location) {
                self.center = location
            }
        default:
            break
        }
    }
    
    /**
     returns true if location inside of view bounds
     **/
    private func checkBounds(for location:CGPoint) -> Bool {
        let screenSize:CGSize = UIScreen.main.bounds.size
        return  location.x + self.width / 2.0 < screenSize.width &&
                location.y + self.width / 2.0 < screenSize.height &&
                location.x - self.width / 2.0 > 0 &&
                location.y - self.width / 2.0 > 0
    }
    
    func generateFrame(position:FABPosition, width:CGFloat) -> CGRect {
        let screenSize = UIScreen.main.bounds
        var x:CGFloat = 0.0
        var y:CGFloat = 0.0
        switch position {
        case .rightBottom:
            x = screenSize.width - width - kDefaultPaddingForButton
            y = screenSize.height - width - kDefaultPaddingForButton
        case .leftBottom:
            x = kDefaultPaddingForButton
            y = screenSize.height - width - kDefaultPaddingForButton
        case .rightTop:
            x = screenSize.width - width - kDefaultPaddingForButton
            y = kDefaultPaddingForButton
        case .leftTop:
            x = kDefaultPaddingForButton
            y = kDefaultPaddingForButton
        }
        
        return CGRect(x: x, y: y, width: width, height: width)
    }
    
}
