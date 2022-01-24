//
//  Rippleable.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import UIKit

internal protocol Rippleable : UIView
{
    var isAnimatingLayerScaled  : Bool { get set }
    var duration                : CGFloat { get set }
    var rippleColor             : UIColor? { get set }
    var rippleOpacity           : CGFloat { get set }
    
    func animateScale(for point: CGPoint, with scale: ScaleType)
    func updateAnimatingLayer()
    
}

extension Rippleable where Self : ShapeableTrackableButton
{
    func animateScale(for point: CGPoint, with scale: ScaleType)
    {
        layer.insertSublayerIfNeeded(layer: rippleLayer, at: 1)
        
        CATransaction.setDisableActions(true)
        rippleLayer.position = point
        CATransaction.commit()
        
        let scaleUp         = scale == .up
        
        let fromValue       : CGFloat = scaleUp ? 0.001     : 1.0
        let toValue         : CGFloat = scaleUp ? 3.0       : 0.001
        let duration        : CGFloat = scaleUp ? duration  : duration / 2.0
        
        let scaleAnimation  = CABasicAnimation.init(option: .transformScaleXY,
                                                    fromValue: fromValue,
                                                    toValue: toValue,
                                                    duration: duration,
                                                    isRemovedOnCompletion: false,
                                                    fillMode: convertFromCAMediaTimingFillMode(CAMediaTimingFillMode.both))
        
        rippleLayer.add(scaleAnimation, forKey: "scaling")
        isAnimatingLayerScaled = scaleUp
    }
}
extension Rippleable where Self : ShapeableTrackableButton
{
    func updateAnimatingLayer()
    {
        guard let lastTouch = lastTouch else { return }
        
        if isHighlighted && !isAnimatingLayerScaled
        {
            animateScale(for: lastTouch, with: .up)
        }
        else if !isHighlighted && isAnimatingLayerScaled
        {
            animateScale(for: lastTouch, with: .down)
        }
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromCAMediaTimingFillMode(_ input: CAMediaTimingFillMode) -> String {
	return input.rawValue
}
