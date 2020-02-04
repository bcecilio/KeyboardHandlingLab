//
//  ScaleClass.swift
//  KeyboardHandlingLab
//
//  Created by Brendon Cecilio on 2/3/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class ScaleSegue: UIStoryboardSegue {
    
    override func perform() {
        scale()
    }
    
    private func scale() {
        let toVC = self.destination
        let fromVC = self.source
        
        let containerView = fromVC.view.superview
        let originalCenter = fromVC.view.center
        
        toVC.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toVC.view.center = originalCenter
        
        containerView?.addSubview(toVC.view)
        
        UIView.animate(withDuration: 0.5, delay: 0.0,options: [.curveEaseInOut], animations: {
            toVC.view.transform = CGAffineTransform.identity
        }, completion: {success in
            fromVC.present(toVC, animated: false, completion: nil)
        })
    }
}
