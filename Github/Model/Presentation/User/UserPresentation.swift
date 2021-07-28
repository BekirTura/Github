//
//  UserPresentation.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
struct UserPresentation {
    let imageUrl: String?
    let username: String?
    let email: String?
    let name: String?
    
    init(userDTO: UserDTO?) {
        self.name = userDTO?.name
        self.email = userDTO?.email
        self.username = userDTO?.login
        self.imageUrl = userDTO?.avatarURL
    }
}
