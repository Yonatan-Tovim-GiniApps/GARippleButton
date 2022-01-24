//
//  ScaleType.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import Foundation

enum ScaleType
{
    case up
    case down
    
    var isScaleUp : Bool
    {
        return self == .up
    }
}
