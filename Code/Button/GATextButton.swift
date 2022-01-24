//
//  TextButton.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import Foundation

public class GATextButton : GARippleButton
{
    @IBInspectable
    var cornerRadius : CGFloat = 5.0
    {
        didSet
        {
            configureCornerRadius()
        }
    }
    
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
    
    public override func awakeFromNib()
    {
        super.awakeFromNib()
        commonInit()
    }
    
    public override func prepareForInterfaceBuilder()
    {
        super.prepareForInterfaceBuilder()
        commonInit()
    }
    
    private func commonInit()
    {
        configureCornerRadius()
    }
    
    private func configureCornerRadius()
    {
        shape = .roundedRect(cornerRadii: cornerRadius)
    }
}
