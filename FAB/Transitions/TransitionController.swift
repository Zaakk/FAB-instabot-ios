//
//  TransitionController.swift
//  FAB
//
//  Created by Alexander Zakatnov on 12.10.17.
//  Copyright © 2017 Alexander Zakatnov. All rights reserved.
//

import Foundation
import UIKit

class TransitionController:NSObject, UIViewControllerTransitioningDelegate {
    
    var fromView:UIView?
    let transition = CircularTransition()
    
    init(transitionFromView:UIView) {
        self.fromView = transitionFromView
    }
    
    override init() {
        
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let btn = self.fromView else {
            return nil
        }
        transition.transitionMode = .present
        transition.startingPoint = btn.center
        return transition
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let btn = self.fromView else {
            return nil
        }
        transition.transitionMode = .dismiss
        transition.startingPoint = btn.center
        return transition
    }
    
}
