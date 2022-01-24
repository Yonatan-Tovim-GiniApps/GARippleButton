//
//  Shapeable.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import UIKit

internal protocol Shapeable : UIView
{
    var shape       : Shape { get set }
    var rippleLayer : CAShapeLayer { get }
    
    func configureLayer()
    func configureShapeLayer()
}

internal extension Shapeable
{
    func configureLayer()
    {
        switch shape
        {
        case .circle                                    : layer.cornerRadius = bounds.width / 2.0
        case .rect                                      : layer.cornerRadius = .zero
        case .roundedRect(cornerRadii: let cornerRadii) : layer.cornerRadius = cornerRadii
        }
    }
    
    func configureShapeLayer()
    {
        let ratio           = max(bounds.height, bounds.width)
        let shapeLayerPath  = UIBezierPath(ovalIn: CGRect(origin: .zero, size: CGSize(width: ratio, height: ratio)))
        rippleLayer.path    = shapeLayerPath.cgPath
        rippleLayer.bounds  = shapeLayerPath.bounds
    }
    
}
