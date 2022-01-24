//
//  UIView+Extensions.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import UIKit

extension UIView
{
    func dropShadow(color: UIColor = UIColor.darkGray, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true)
    {
        layer.masksToBounds         = false
        layer.shadowColor           = color.cgColor
        layer.shadowOpacity         = opacity
        layer.shadowOffset          = offSet
        layer.shadowRadius          = radius
        
        layer.shadowPath            = UIBezierPath(rect: self.bounds.insetBy(dx: 8.0, dy: 8.0)).cgPath
        layer.shouldRasterize       = true
        layer.rasterizationScale    = scale ? UIScreen.main.scale : 1
      }
}
