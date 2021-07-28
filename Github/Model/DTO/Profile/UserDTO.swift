//
//  UserDTO.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
public struct UserDTO: Decodable {
    public let id: Int?
    public let name: String?
    public let email: String?
    public let login: String?
    public let location: String?
    public let avatarURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case email = "email"
        case login = "login"
        case location = "location"
        case avatarURL = "avatar_url"
    }
    
}
