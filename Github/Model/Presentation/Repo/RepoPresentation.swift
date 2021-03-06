//
//  RepoPresentation.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
struct RepoPresentation {
    let ownerID: Int?
    let repoName: String?
    let ownerName: String?
    let imageUrl: String?
    let programmingLanguage: String?
    let watchersCount:Int?
    let forksCount:Int?
    
    init(repoDTO: RepoDTO?) {
        self.ownerID = repoDTO?.owner?.id
        self.repoName = repoDTO?.name
        self.ownerName = repoDTO?.owner?.login
        self.imageUrl = repoDTO?.owner?.avatarURL
        self.programmingLanguage = repoDTO?.programmingLanguage
        self.watchersCount = repoDTO?.watchersCount
        self.forksCount = repoDTO?.forksCount
    }
}

