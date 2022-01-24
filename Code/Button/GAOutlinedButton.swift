//
//  GAOutlinedButton.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import UIKit

protocol OutlinedButtonProtocol
{
    var borderWidth : CGFloat { get set }
    var borderColor : UIColor { get set }
}

@IBDesignable
public class GAOutlinedButton: ShapeableTrackableButton, Rippleable, OutlinedButtonProtocol
{
    //MARK: - Inspectable
    @IBInspectable
    var borderWidth                             : CGFloat = 1.0
    {
        didSet
        {
            configureBorder()
        }
    }
    
    @IBInspectable
    var borderColor                             : UIColor = .purple
    {
        didSet
        {
            configureBorder()
        }
    }

    @IBInspectable
    public var rippleColor                      : UIColor? = nil
    {
        didSet
        {
            configureRippleColor()
        }
    }
    @IBInspectable
    public var rippleOpacity                    : CGFloat = 0.1
    {
        didSet
        {
            configureRippleColor()
        }
    }
    
    //MARK: - Property
    internal var isAnimatingLayerScaled         = false
    internal var duration                       : CGFloat = 0.4
    public internal(set) override var lastTouch : CGPoint?
    {
        didSet
        {
            updateAnimatingLayer()
        }
    }
    
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
}

//MARK: - Private API
extension GAOutlinedButton
{
    private func commonInit()
    {
        layer.masksToBounds = true
        clipsToBounds       = true
        
        rippleColor == nil ? rippleColor = titleLabel?.textColor.withAlphaComponent(rippleOpacity) : Void()
        configureBorder()
        configureRippleColor()
    }
    
    private func configureRippleColor()
    {
        rippleLayer.fillColor = rippleColor?.withAlphaComponent(rippleOpacity).cgColor
    }
    
    private func configureBorder()
    {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
}
