//
//  UIViewController+Extension.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlertPopup(title: String, message: String, preferredStyle: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
        }
        alert.addAction(okAction)
        self.present(alert, animated: false, completion: nil)
    }
}

