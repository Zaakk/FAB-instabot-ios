//
//  Transition.swift
//  FAB
//
//  Created by Zakatnov's on 12.10.17.
//  Copyright © 2017 Alexander Zakatnov. All rights reserved.
//

import UIKit
import Foundation

@objc public enum TransitionMode: Int {
    case present
    case dismiss
}

@objc public class BubbleTransition: NSObject {
    public var startingPoint: CGPoint
    public var transitionMode: TransitionMode
    public var bubbleColor: UIColor?
    
    private var bubble: UIView!
    private var presentingDuration: Double
    private var dismissDuration: Double
    
    public override init() {
        self.presentingDuration = 0.5
        self.dismissDuration = 0.35
        
        self.startingPoint = CGPoint(x: 0.0, y: 0.0)
        self.transitionMode = .present
    }
    
    private func frameForBubbleWithSize(originalSize: CGSize, start: CGPoint) -> CGRect {
        let lengthX = fmax(start.x, originalSize.width - start.x);
        let lengthY = fmax(start.y, originalSize.height - start.y)
        
        let offset = sqrt(lengthX * lengthX + lengthY * lengthY) * 2;
        
        return CGRect(x: 0, y: 0, width: offset, height: offset)
    }
}

extension BubbleTransition: UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.transitionMode == .present ? self.presentingDuration : self.dismissDuration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let toView = transitionContext.view(forKey: .to), let fromView = transitionContext.view(forKey: .from) else {
            return
        }
        
        if transitionMode == .present {
            let originalCenter = toView.center
            let originalSize = toView.frame.size
            
            let frame: CGRect = self.frameForBubbleWithSize(originalSize: originalSize, start: self.startingPoint)
            
            self.bubble = UIView(frame: frame)
            self.bubble.layer.cornerRadius = self.bubble.frame.height / 2
            self.bubble.center = self.startingPoint
            self.bubble.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            
            if let bubbleColor = self.bubbleColor {
                self.bubble.backgroundColor = bubbleColor
            } else {
                self.bubble.backgroundColor = toView.backgroundColor
            }
            
            toView.center = startingPoint
            toView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            toView.alpha = 0
            
            containerView.addSubview(toView)
            containerView.addSubview(self.bubble)
            
            UIView.animate(withDuration: self.presentingDuration,
                                       animations: {
                    self.bubble.transform = CGAffineTransform.identity
                    
                    toView.transform = CGAffineTransform.identity
                    toView.alpha = 1
                    toView.center = originalCenter
            },
                                       completion: { (finished: Bool) -> (Void) in
                                        if finished {
                                            self.bubble.removeFromSuperview()
                                            
                                            transitionContext.completeTransition(true)
                                        }
            })
        } else {
            let originalSize = fromView.frame.size
            
            self.bubble.frame = self.frameForBubbleWithSize(originalSize: originalSize, start: startingPoint)
            self.bubble.layer.cornerRadius = self.bubble.frame.height / 2
            self.bubble.center = self.startingPoint
            
            containerView.addSubview(toView)
            containerView.addSubview(self.bubble)
            
            UIView.animate(withDuration: self.dismissDuration,
                                       animations: {
                    self.bubble.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            },
                                       completion: { (finished: Bool) -> (Void) in
                                        if finished {
                                            toView.removeFromSuperview()
                                            self.bubble.removeFromSuperview()
                                            
                                            transitionContext.completeTransition(true)
                                        }
            })
        }
    }
}
