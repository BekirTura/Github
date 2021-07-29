//
//  BaseViewInteractor.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
class BaseViewInteractor {
    
    var restClient: RestClientable
    
    init(restClient: RestClientable = RestClient.sharedInstance) {
        self.restClient = restClient
    }
}
