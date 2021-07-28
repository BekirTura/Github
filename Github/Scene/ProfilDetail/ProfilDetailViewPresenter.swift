//
//  ProfilDetailPresenter.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
final class ProfilDetailViewPresenter:BasePresenter {
    private weak var view: ProfilDetailViewProtocol?
    private let router: ProfilDetailViewRouterProtocol?
    private let interactor: ProfilDetailViewInteractorProtocol?
    private let name: String?

  //  var movieDetailPagePresentation: MovieDetailPagePresentation?
    
    init(view: ProfilDetailViewProtocol?, router: ProfilDetailViewRouterProtocol?, interactor: ProfilDetailViewInteractorProtocol?,name:String?) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.name = name
    }

}
extension ProfilDetailViewPresenter: ProfilDetailViewInteractorOutputProtocol {
    func onSuccessUser(userDTO: UserDTO?) {
        if let userDTO = userDTO{
            let userPresentation = UserPresentation.init(userDTO: userDTO)
            self.view?.reloadUserData(user: userPresentation)
        }
    }
    
    func onSuccessUserRepo(repoListDTO: [RepoDTO]?) {
        if let repoDTOList = repoListDTO{
            let repoPrensetationList = repoDTOList.map{RepoPresentation(repoDTO: $0)}
            self.view?.reloadUserRepoData(repoList: repoPrensetationList)
        }
    }
    
    override func showLoading(isLoad: Bool) {
        view?.showLoading(isLoad: isLoad)
    }
    
}

extension ProfilDetailViewPresenter: ProfilDetailViewPresenterProtocol{
    func getUserProfile() {
        interactor?.getUserProfile(name: name ?? "")
    }
    
    func getUserProfileRepo() {
        interactor?.getUserProfileRepo(name: name ?? "")
    }
}
