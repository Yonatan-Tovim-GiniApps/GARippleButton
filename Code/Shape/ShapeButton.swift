//
//  ShapeButton.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import UIKit

public class ShapeButton : UIButton
{
    open var shape          : Shape = .roundedRect(cornerRadii: 10.0)
    open var rippleLayer    : CAShapeLayer = CAShapeLayer()
    
    public override func layoutSubviews()
    {
        super.layoutSubviews()
        configureLayer()
        configureRippleLayer()
    }
}

extension ShapeButton : Shapeable {}
