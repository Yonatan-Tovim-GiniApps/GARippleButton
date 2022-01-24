//
//  CALayer+Extensions.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import Foundation

extension CALayer
{
    func insertSublayerIfNeeded(layer: CALayer, at idx: UInt32)
    {
        guard let sublayers = sublayers else { return }
        guard !sublayers.contains(layer) else { return }
        insertSublayer(layer, at: idx)
    }
}
