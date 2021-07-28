//
//  ProfilDetailViewInteractor.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation

final class ProfilDetailViewInteractor:BaseViewInteractor {
    weak var output: ProfilDetailViewInteractorOutputProtocol?
}

extension ProfilDetailViewInteractor: ProfilDetailViewInteractorProtocol {

    func getUserProfile(name: String?) {
        let userRequest = UserRequest(name: name ?? "")
        self.output?.showLoading(isLoad: true)
        restClient.sendRequest(userRequest, UserDTO.self) { response in
            self.output?.showLoading(isLoad: false)
            self.output?.onSuccessUser(userDTO: response)
        } failHandler: { error, errorString in
            self.output?.showLoading(isLoad: false)
            self.output?.onErrorPopup(errorString: errorString ?? "")
        }
    }
    
    func getUserProfileRepo(name: String?) {
        let userRepoRequest =  UserRepoRequest.init(name: name ?? "")
        self.output?.showLoading(isLoad: true)
        restClient.sendRequest(userRepoRequest, [RepoDTO].self) { response in
            self.output?.showLoading(isLoad: false)
            self.output?.onSuccessUserRepo(repoListDTO: response)
        } failHandler: { error, errorString in
            self.output?.showLoading(isLoad: false)
            self.output?.onErrorPopup(errorString: errorString ?? "")
        }
    }
}
