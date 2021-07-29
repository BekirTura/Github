//
//  RepoDetailViewPresenter.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
final class RepoDetailViewPresenter:BasePresenter {
    
    private weak var view: RepoDetailViewProtocol?
    private let router: RepoDetailViewRouterProtocol?
    private let interactor: RepoDetailViewInteractorProtocol?
    private let repo: RepoPresentation?
    init(view: RepoDetailViewProtocol?, router: RepoDetailViewRouterProtocol?, interactor: RepoDetailViewInteractorProtocol?,repo: RepoPresentation?) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.repo = repo
    }
    

}

extension RepoDetailViewPresenter: RepoDetailViewPresenterProtocol{
    func getRepo() {
        self.view?.repoLoadUI(repo: self.repo)
    }
    

    
}


extension RepoDetailViewPresenter:RepoDetailViewInteractorOutputProtocol{
    
}
