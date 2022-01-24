//
//  GAContainedButton.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import Foundation

protocol ContainedButtonProtocol
{
    var containingColor : UIColor { get set }
}

@IBDesignable
public class GAContainedButton: ShapeableTrackableButton, Rippleable
{
    let containerLayer  : CAShapeLayer = {
        let containerLayer = CAShapeLayer()
        
        return containerLayer
    }()
    
    let shadowLayer     : CAShapeLayer = {
        let shadowLayer             = CAShapeLayer()
        shadowLayer.shadowOpacity   = 0.75
        shadowLayer.shadowOffset    = .zero
        shadowLayer.shadowRadius    = 3.0
        
        return shadowLayer
    }()
    
    //MARK: - Inspectable
    @IBInspectable
    public var containerColor                   : UIColor? = .blue
    {
        didSet
        {
            configureContainerColor()
        }
    }
    
    @IBInspectable
    public var rippleColor                      : UIColor? = .black
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
    
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool
    {
        return containerLayer.path?.contains(point) ?? super.point(inside: point, with: event)
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
    
    public override func layoutSubviews()
    {
        super.layoutSubviews()
        let padding             = 6.0
        let cornerRadius        = calculateCornerRadius(shape: shape)
        let boundsForLayer      = bounds.insetBy(dx: padding, dy: padding)
        let pathForLayer        = UIBezierPath(roundedRect: boundsForLayer, cornerRadius: cornerRadius).cgPath
        let positionForLayer    = CGPoint(x: boundsForLayer.midX, y: boundsForLayer.midY)
        shadowLayer.shadowPath  = pathForLayer
        
        updateContainerLayer(path: pathForLayer, bounds: boundsForLayer, position: positionForLayer)
    }

    func animateScale(for point: CGPoint, with scale: ScaleType)
    {
        containerLayer.addSublayer(rippleLayer)
        CATransaction.setDisableActions(true)
        rippleLayer.position = point
        CATransaction.commit()
        
        let scaleUp         = scale.isScaleUp
        
        let fromValue       : CGFloat = scaleUp ? 0.001     : 1.0
        let toValue         : CGFloat = scaleUp ? 3.0       : 0.001
        let duration        : CGFloat = scaleUp ? duration  : duration / 2.0
        
        let scaleAnimation  = CABasicAnimation.init(option               : .transformScaleXY,
                                                    fromValue            : fromValue,
                                                    toValue              : toValue,
                                                    duration             : duration,
                                                    isRemovedOnCompletion: false,
                                                    fillMode             : convertFromCAMediaTimingFillMode(CAMediaTimingFillMode.both))
        
        rippleLayer.add(scaleAnimation, forKey: "scaling")
        isAnimatingLayerScaled = scaleUp
    }
}

//MARK: - Private API
extension GAContainedButton
{
    private func commonInit()
    {
        clipsToBounds       = true
        layer.masksToBounds = false

        rippleColor == nil ? rippleColor = titleLabel?.textColor.withAlphaComponent(rippleOpacity) : Void()
        layer.insertSublayer(shadowLayer, at: 0)
        layer.insertSublayer(containerLayer, at: 3)

        containerLayer.masksToBounds = true
    }
    
    private func configureRippleColor()
    {
        rippleLayer.fillColor = rippleColor?.withAlphaComponent(rippleOpacity).cgColor
    }
    
    private func configureContainerColor()
    {
        containerLayer.fillColor = containerColor?.cgColor
    }
    
    private func updateContainerLayer(path: CGPath, bounds: CGRect, position: CGPoint)
    {
        containerLayer.path         = path
        containerLayer.bounds       = bounds
        containerLayer.cornerRadius = layer.cornerRadius
        containerLayer.position.x   = position.x
        containerLayer.position.y   = position.y
    }
    
    private func calculateCornerRadius(shape: Shape) -> CGFloat
    {
        switch shape
        {
        case .rect                      : return .zero
        case .circle                    : return bounds.width / 2.0
        case .roundedRect(let radius)   : return radius
        }
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromCAMediaTimingFillMode(_ input: CAMediaTimingFillMode) -> String {
	return input.rawValue
}
