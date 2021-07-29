//
//  RepoDTO.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

struct RepoDTO: Decodable {
    let id: Int?
    let name: String?
    let fullName: String?
    let owner: RepoOwnerDTO?
    let forksCount: Int?
    let defaultBranchName: String?
    let programmingLanguage: String?
    let isPrivate: Bool?
    let watchersCount:Int?
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case owner = "owner"
        case forksCount = "forks_count"
        case defaultBranchName = "default_branch"
        case programmingLanguage = "language"
        case fullName = "full_name"
        case isPrivate = "private"
        case watchersCount = "watchers_count"
    }
}
