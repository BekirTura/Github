//
//  SearchViewContracts.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
protocol SearchViewInteractorProtocol {
    func searchRepoRequest(text: String?)
}


protocol SearchViewInteractorOutputProtocol: BaseOutputProtocol {
    func onSuccessRepoList(repoDTOList: [RepoDTO]?)

}

protocol SearchViewPresenterProtocol: BaseViewPresenterProtocol {
}
protocol SearchViewProtocol: BaseViewProtocol {
    func reloadUIData(repoPresentationList:[RepoPresentation])
    func noDataVisible()
    func activeSearchBar()
}

protocol SearchViewRouterProtocol {
    func navigateToUserDetail(with id: Int)
}
