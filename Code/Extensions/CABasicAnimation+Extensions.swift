//
//  CABasicAnimation+Extensions.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import Foundation

public extension CABasicAnimation
{
    enum Option : String
    {
        case transformScaleXY = "transform.scale.xy"
    }
    
    convenience init(option: Option, fromValue: CGFloat, toValue: CGFloat, duration: CGFloat, isRemovedOnCompletion: Bool = false, fillMode: String)
    {
        self.init(keyPath: option.rawValue)
        self.fromValue                = fromValue
        self.toValue                  = toValue
        self.isRemovedOnCompletion    = isRemovedOnCompletion
        self.duration                 = duration
        self.fillMode                 = convertToCAMediaTimingFillMode(fillMode)
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToCAMediaTimingFillMode(_ input: String) -> CAMediaTimingFillMode {
	return CAMediaTimingFillMode(rawValue: input)
}
