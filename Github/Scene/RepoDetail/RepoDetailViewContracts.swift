//
//  RepoDetailViewContracts.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
protocol RepoDetailViewInteractorProtocol {
}


protocol RepoDetailViewInteractorOutputProtocol: BaseOutputProtocol {

}

protocol RepoDetailViewPresenterProtocol: BaseViewPresenterProtocol {
    func getRepo()
    
}
protocol RepoDetailViewProtocol: BaseViewProtocol {
    func repoLoadUI(repo:RepoPresentation?)
}

protocol RepoDetailViewRouterProtocol {
}
