//
//  ShapeableTrackableButton.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import UIKit

public class ShapeableTrackableButton : UIButton
{
    internal var shape          : Shape = .roundedRect(cornerRadii: 10.0)
    internal let rippleLayer    : CAShapeLayer = CAShapeLayer()
    internal var lastTouch      : CGPoint?
    
    //MARK: - Lifecycle
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        commonInit()
    }
    

    override public func layoutSubviews()
    {
        super.layoutSubviews()
        subviews.forEach
        {
            $0.clipsToBounds = true
        }
        configureLayer()
        configureShapeLayer()
    }
    
    private func commonInit()
    {
        setupEdgeInsets()
    }
}

//MARK: - Lifecycle
public extension ShapeableTrackableButton
{
    private func setupEdgeInsets()
    {
        let margin = 8.0
        let marginInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        if #available(iOS 15, *)
        {
            var config              = Configuration.plain()
            config.contentInsets    = NSDirectionalEdgeInsets(top: margin, leading: margin, bottom: margin, trailing: margin)
            configuration           = config
        }else
        {
            contentEdgeInsets       = marginInset
        }
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
