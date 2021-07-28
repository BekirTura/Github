//
//  UserRequest.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
struct UserRequest: BaseApiRequest {
    var requestMethod: RequestHttpMethod = .GET
    var requestBodyObject: Data?
    var parameters: [URLQueryItem]?
    var headers: [String : String] = [:]
    var name:String = ""
    
    public var requestPath: String {
        get{
            return "/users/" + name
        }
    }
    
    init(name: String) {
        self.name = name
    }
}
