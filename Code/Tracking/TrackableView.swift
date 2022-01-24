//
//  TrackableView.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import Foundation

public class TrackableView: UIView ,Trackable
{
    internal var lastTouch  : CGPoint?
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        super.touchesBegan(touches, with: event)
        
        guard let touch = touches.first else { return }
        
        let point = touch.location(in: self)
        lastTouch = point
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        super.touchesEnded(touches, with: event)
        guard let touch = touches.first else { return }
        
        let point   = touch.location(in: self)
        lastTouch   = point
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        super.touchesMoved(touches, with: event)
        
        guard let touch = touches.first else { return }

        let touchPoint = touch.location(in: self)
        
        guard let calculatedPoint = touchPoint.createPointFrom(bounds: bounds) else { return }
        
        lastTouch = calculatedPoint
    }
}
