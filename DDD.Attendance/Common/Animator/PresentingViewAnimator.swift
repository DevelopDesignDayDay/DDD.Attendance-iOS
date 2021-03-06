//
//  PresentingViewAnimator.swift
//  DDD.Attendance
//
//  Created by seongjun.park on 08/09/2019.
//  Copyright © 2019 DDD. All rights reserved.
//

import UIKit

protocol Animatable {
    
    var animatableBackgroundView: UIView { get }
    
    var animatableMainView: UIView { get }
    
    func prepareBeingDismissed()
}

class PresentingViewAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    let duration: TimeInterval
    let initialY: CGFloat
    
    init(duration: TimeInterval = 0.4, initialY: CGFloat) {
        self.duration = duration
        self.initialY = initialY
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to),
            let animatableToVC = toVC as? Animatable else {
                return
        }
        let fromVCRect = transitionContext.initialFrame(for: fromVC)
        var toVCRect = fromVCRect
        toVCRect.origin.y = toVCRect.size.height - initialY
        animatableToVC.animatableMainView.frame = toVCRect
        toVC.view.frame = fromVCRect
        animatableToVC.animatableBackgroundView.alpha = 0
        transitionContext.containerView.addSubview(toVC.view)
        fromVC.beginAppearanceTransition(false, animated: true)
        toVC.beginAppearanceTransition(true, animated: true)
        
        UIView.animate(withDuration: duration, animations: {
            animatableToVC.animatableMainView.frame = fromVCRect
            animatableToVC.animatableBackgroundView.alpha = 1
        }) { _ in
            fromVC.beginAppearanceTransition(transitionContext.transitionWasCancelled, animated: false)
            fromVC.endAppearanceTransition()
            toVC.endAppearanceTransition()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
