//
//  BaseApiRequest.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//
// Network: https://gist.github.com/BekirTura/f929856b00bd2ee331f0f64fcc972b2e
//

import Foundation

protocol BaseApiRequest {
    var requestMethod: RequestHttpMethod { get }
    var requestBodyObject: Data? { get }
    var requestPath: String { get }
    var constructedURL: URL? {get}
    var headers: [String: String] { get }
    var parameters: [URLQueryItem]? { get set }
    func request() -> URLRequest?
}

extension BaseApiRequest {
    
    var environment: Environment {
        Environment.Prod
    }
    
    var scheme: Scheme {
        Scheme.https
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    public func baseUrl() -> String?  {
        var baseUrl:String?
        switch environment {
        case .Prod:
            baseUrl = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String
        case .Uat:
            baseUrl = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String
        case .Test:
            baseUrl = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String
        case .Dev:
            baseUrl = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String
        }
        if let baseUrl = baseUrl {
            return baseUrl
        }else{
            fatalError("--- Not Avaiable Base Url ----")
        }
    }
    
    var constructedURL: URL? {
        var components = URLComponents()
        components.host = baseUrl()
        components.scheme = scheme.rawValue
        components.path = requestPath
        components.queryItems = parameters
        return components.url
    }

    func request() -> URLRequest? {
        if let url = constructedURL {
            var request = URLRequest(url: url)
            request.timeoutInterval = 40
            request.httpMethod = requestMethod.rawValue
            request.allHTTPHeaderFields = headers
            request.httpBody = requestBodyObject
            return request
        }
        return nil
    }
}

enum RequestHttpMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

public enum Environment {
    case Prod
    case Uat
    case Test
    case Dev
}


public enum Scheme:String {
    case https
    case http
}




