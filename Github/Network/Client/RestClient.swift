//
//  RestClient.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
import Alamofire

protocol RestClientable {
    func sendRequest<T:Decodable>(_ request:BaseApiRequest,_ type :T.Type,successHandler:@escaping(T?)->(),failHandler:@escaping(Error?,String?)->())
}

class RestClient: RestClientable{
    static let sharedInstance:RestClient = RestClient.init()
    private init() {}
    func sendRequest<T:Decodable>(_ request:BaseApiRequest,_ type :T.Type,successHandler:@escaping(T?)->(),failHandler:@escaping(Error?,String?)->()){
        if let request = request.request(){
            AF.request(request).responseJSON(completionHandler: { (reponse) in
                print(reponse)
            }).responseDecodable { (response:AFDataResponse<T>) in
                 switch response.result{
                        case .success(let responseEventList):
                            successHandler(responseEventList)
                                
                        case .failure(let error):
                            failHandler(error,error.localizedDescription)
                }
            }
        }else {
            failHandler(nil,"Api Request Implementation Error.")
        }
       
    }

}
