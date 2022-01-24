//
//  ShapeableTrackableButton.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import UIKit

public class ShapeableTrackableButton : UIButton
{
    open var shape              : Shape = .roundedRect(cornerRadii: 10.0)
    internal let rippleLayer    : CAShapeLayer = CAShapeLayer()
    internal var lastTouch      : CGPoint?   
}

//MARK: - Lifecycle
public extension ShapeableTrackableButton
{
    override func layoutSubviews()
    {
        super.layoutSubviews()
        subviews.forEach
        {
            $0.clipsToBounds = true
        }
        configureLayer()
        configureShapeLayer()
    }
}

//MARK: - Touches
public extension ShapeableTrackableButton
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        super.touchesBegan(touches, with: event)
        calculatePoint(touches.first)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        super.touchesEnded(touches, with: event)
        calculatePoint(touches.first)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        super.touchesMoved(touches, with: event)
        
        guard let touch = touches.first else { return }

        let touchPoint = touch.location(in: self)
        
        guard let calculatedPoint = touchPoint.createPointFrom(bounds: bounds) else { return }
        
        lastTouch = calculatedPoint
    }
}

extension ShapeableTrackableButton : Shapeable, Trackable {}
