//
//  BasePresenter.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import UIKit
class BasePresenter{
    
}

extension BasePresenter:BaseOutputProtocol{
    @objc func showLoading(isLoad: Bool) {}
        
    @objc func onErrorPopup(errorString: String) {
        if let keyWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first, let rootVC = keyWindow.rootViewController {
            rootVC.showAlertPopup(title: "Error", message: errorString, preferredStyle: .alert)
        }
    }
}
