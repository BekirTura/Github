//
//  BaseListDTO.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
class BaseListDTO<T:Decodable>: Decodable {
    let totalCount: Int?
    let items: T? 

    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items = "items"
    }
    

}
