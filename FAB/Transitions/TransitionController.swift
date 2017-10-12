//
//  TransitionController.swift
//  FAB
//
//  Created by Zakatnov's on 12.10.17.
//  Copyright © 2017 Alexander Zakatnov. All rights reserved.
//

import Foundation
import UIKit

class TransitionController:NSObject, UIViewControllerTransitioningDelegate {
    
    var fromView:UIView!
    let transition = BubbleTransition()
    
    init(transitionFromView:UIView) {
        self.fromView = transitionFromView
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = self.fromView.center
        transition.bubbleColor = UIColor.white
        return transition
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = self.fromView.center
        transition.bubbleColor = UIColor.white
        return transition
    }
    
}
