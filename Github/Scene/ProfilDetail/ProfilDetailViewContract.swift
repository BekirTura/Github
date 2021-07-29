//
//  ProfilDetailViewContract.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
protocol ProfilDetailViewInteractorProtocol {
    func getUserProfile(name: String?)
    func getUserProfileRepo(name: String?)
}


protocol ProfilDetailViewInteractorOutputProtocol: BaseOutputProtocol {
    func onSuccessUser(userDTO: UserDTO?)
    func onSuccessUserRepo(repoListDTO: [RepoDTO]?)
}

protocol ProfilDetailViewPresenterProtocol: BaseViewPresenterProtocol {
    func getUserProfile()
    func getUserProfileRepo()
}
protocol ProfilDetailViewProtocol: BaseViewProtocol {
    func reloadUserData(user:UserPresentation)
    func reloadUserRepoData(repoList:[RepoPresentation])
}

protocol ProfilDetailViewRouterProtocol {
}
