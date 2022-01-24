//
//  TypedButton.swift
//  GARippleButton
//
//  Created by Lidor Fadida on 24/01/2022.
//

import Foundation

enum ׳Type׳
{
    case text
    case outlined
    case contained
}

protocol Typeable
{
    var type : ׳Type׳ { get }
}
