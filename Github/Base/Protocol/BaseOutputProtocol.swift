//
//  BaseOutputProtocol.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
protocol BaseOutputProtocol: AnyObject {
    func showLoading(isLoad:Bool)
    func onErrorPopup(errorString:String)
}
