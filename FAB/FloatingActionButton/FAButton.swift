//
//  FAButton.swift
//  FAB
//
//  Created by Alexander Zakatnov on 11.10.17.
//  Copyright © 2017 Alexander Zakatnov. All rights reserved.
//

import Foundation
import UIKit

/// Possible inititial positions of the button
///
/// - rightBottom: right bottom corner
/// - leftBottom: left bottom corner
/// - rightTop: right top corner
/// - leftTop: left top corner
enum FABPosition: NSInteger {
    case rightBottom
	case leftBottom
	case rightTop
	case leftTop
}


/// Button state
///
/// - normal: Normal state of button
/// - loading: Button tapped, waiting for server response. Activity indicator is shown
enum FABState: NSInteger {
	case normal
	case loading
}

let kDefaultPaddingForButton:CGFloat = 16.0
let kFABTapEventName = "FABTapped"

/// Floating Action Button.
class FAButton: UIButton {
    
    internal var width: CGFloat = 25.0
    internal var draggable: Bool = true
    internal var position:FABPosition = .rightBottom
    internal var loadingIndicator:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
    
    internal static var globalBtn:FAButton?
    
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
    
    static var globalButtonImage: UIImage? {
        didSet {
            guard let btn = globalBtn else {
                return
            }
            guard let image = globalButtonImage else {
                return
            }
            btn.setImage(globalButtonImage, for: .normal)
            btn.setTitle(nil, for: .normal)
            btn.backgroundColor = UIColor.clear
            btn.frame = btn.frame(for: btn.position, width: image.size.width, height: image.size.height)
        }
    }
    
    /// Instantiates and adds button on root window.
    ///
    /// - Parameters:
    ///   - width: size of square button
    ///   - position: start position on screen
    ///   - draggable: enable/disable drag&drop
    static func addToWindow(width:CGFloat = 25.0, position:FABPosition = .rightBottom, draggable:Bool = true) {
        guard globalBtn == nil else {
            return
        }
        globalBtn = FAButton(width: width, position: position, draggable: draggable)
        guard let btn = globalBtn else {
            return
        }
        UIApplication.shared.keyWindow?.addSubview(btn)
    }
    
    init(width:CGFloat = 25.0, position:FABPosition = .rightBottom, draggable:Bool = true) {
        super.init(frame: frame(for: position, width: width, height: width))
        self.backgroundColor = UIColor.red
        self.width = width
        self.draggable = draggable
        self.position = position
        
        configureView()
        
        self.addTarget(self, action: #selector(self.tap), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var frame: CGRect {
        didSet {
            loadingIndicator.center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        }
    }
    
    private func configureView() {
        self.setTitle("I", for: .normal)
        self.layer.cornerRadius = self.width / 2.0
        if self.draggable {
            let pan = UIPanGestureRecognizer(target: self, action: #selector(self.panButton(pan:)))
            self.addGestureRecognizer(pan)
        }
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
    
    func frame(for position:FABPosition, width:CGFloat, height:CGFloat) -> CGRect {
        let screenSize = UIScreen.main.bounds
        var x:CGFloat = 0.0
        var y:CGFloat = 0.0
        switch position {
        case .rightBottom:
            x = screenSize.width - width - kDefaultPaddingForButton
            y = screenSize.height - height - kDefaultPaddingForButton
        case .leftBottom:
            x = kDefaultPaddingForButton
            y = screenSize.height - height - kDefaultPaddingForButton
        case .rightTop:
            x = screenSize.width - width - kDefaultPaddingForButton
            y = kDefaultPaddingForButton
        case .leftTop:
            x = kDefaultPaddingForButton
            y = kDefaultPaddingForButton
        }
        
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
}
