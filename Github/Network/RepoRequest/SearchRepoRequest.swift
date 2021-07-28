//
//  SearchRepoRequest.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation

struct SearchReposRequest: BaseApiRequest {
    var requestMethod: RequestHttpMethod = .GET
    var requestBodyObject: Data?
    var requestPath: String = "/search/repositories"
    var parameters: [URLQueryItem]?
    var headers: [String : String] = [:]
}
