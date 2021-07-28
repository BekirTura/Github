//
//  BaseViewController.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import UIKit
class BaseViewController: UIViewController {
    var vSpinner : UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BaseViewController: BaseViewProtocol {
    
    private enum Constants {
       static let spinnerBackgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
    }

    func showLoading(isLoad: Bool) {
        if(isLoad && vSpinner == nil){
            showSpinner(onView: self.view)
        }else{
            removeSpinner()
        }
    }

    func showSpinner(onView : UIView) {
        let spinnerView = UIView(frame: onView.bounds)
        spinnerView.backgroundColor = Constants.spinnerBackgroundColor
        let ai = UIActivityIndicatorView(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
   
    
    
}
