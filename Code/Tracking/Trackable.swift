//
//  Trackable.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import UIKit


protocol Trackable : UIView
{
    var lastTouch  : CGPoint? { get set }
    
    func calculatePoint(_ touch: UITouch?)
}

extension Trackable
{
    func calculatePoint(_ touch: UITouch?)
    {
        guard let touch = touch else { return }
        
        let point   = touch.location(in: self)
        lastTouch   = point
    }
}
