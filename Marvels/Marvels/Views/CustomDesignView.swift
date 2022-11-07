//
//  CustomDesignView.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 19/02/22.
//

import Foundation
import UIKit

@IBDesignable class CustomDesignView : UIView {
    
    @IBInspectable var cornerRadius : CGFloat = 0
    @IBInspectable var shadowColor : UIColor? = UIColor.black
    
    @IBInspectable var shadowOffSetWidth : Int = 0
    @IBInspectable var shadowOffSetHeight : Int = 1
    
    @IBInspectable var shadowOpacity : Float = 0.2
    
    override func layoutSubviews() {
        
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor?.cgColor
        
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
        
        layer.shadowOpacity = shadowOpacity
        
    }
    
}
