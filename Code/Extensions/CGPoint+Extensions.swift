//
//  CGPoint+Extensions.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import Foundation

public extension CGPoint
{
    func createPointFrom(bounds: CGRect) -> CGPoint?
    {
        let x       = self.x
        let y       = self.y
        
        let topLeft         = (x < bounds.minX && y < bounds.minY)
            
        let bottomLeft      = (x < bounds.minX && y > bounds.maxY)
            
        let topRight        = (x > bounds.maxX && y < bounds.minY)
            
        let bottomRight     = (x > bounds.maxX && y > bounds.maxY)
            
        let inRangeLeft     = (x < bounds.minX && y > bounds.minY && y < bounds.maxY)
        
        let inRangeRight    = (x > bounds.maxX && y > bounds.minY && y < bounds.maxY)
        
        let inRangeTop      = (x > bounds.minX && x < bounds.maxX && y < bounds.minY)
        
        let inRangeBottom   = (x > bounds.minX && x < bounds.maxX && y > bounds.maxY)
        
        if topLeft
        {
            return  CGPoint(x: bounds.minX, y: bounds.minY)
        }
        
        if bottomLeft
        {
            return CGPoint(x: bounds.minX, y: bounds.maxY)
        }
        
        if topRight
        {
            return CGPoint(x: bounds.maxX, y: bounds.minY)
        }
        
        if bottomRight
        {
            return CGPoint(x: bounds.maxX, y: bounds.maxY)
        }

        if inRangeLeft
        {
            return CGPoint(x: bounds.minX, y: y)
        }
        
        if inRangeBottom
        {
            return CGPoint(x: x, y: bounds.maxY)
        }

        if inRangeTop
        {
            return CGPoint(x: x, y: bounds.minY)
        }

        if inRangeRight
        {
            return CGPoint(x: bounds.maxX, y: y)
        }
        
        return nil
    }
}
