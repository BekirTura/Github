//
//  BaseImageView.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//
import UIKit

@IBDesignable class BaseImageView: UIImageView {

    @IBInspectable
     var borderColor: UIColor? {
         get {
             if let color = layer.borderColor {
                 return UIColor(cgColor: color)
             }
             return nil
         }
         set {
             if let color = newValue {
                 layer.borderColor = color.cgColor
             } else {
                 layer.borderColor = nil
             }
         }
     }
     @IBInspectable var borderWidth: CGFloat {
            get { return self.layer.borderWidth }
            set { self.layer.borderWidth = newValue }
        }
     
    
    @IBInspectable
    var isCircle: Bool {
        get {
            return true
        }
        set {
            self.layer.cornerRadius = self.layer.frame.width / 2
            self.clipsToBounds = true
        }
    }
    
        
    @IBInspectable  var cornerRadius: CGFloat {
        get { return self.layer.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }


    @IBInspectable var shadowRadius: CGFloat {
        get { self.layer.shadowRadius }
        set {
            self.layer.masksToBounds = false
             // self.layer.shadowColor = DinamikColors.PrimaryTextFieldShadow.value?.cgColor
             self.layer.shadowRadius = newValue
             self.layer.shadowOpacity = 0.1
             self.layer.shadowOffset = CGSize(width: 0, height: 3)
        }
    }
}
