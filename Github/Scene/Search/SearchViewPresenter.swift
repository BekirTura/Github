//
//  SearchViewPresenter.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
final class SearchViewPresenter:BasePresenter {
    private weak var view: SearchViewProtocol?
    private let router: SearchViewRouterProtocol?
    private let interactor: SearchViewInteractorProtocol?
        
  //  var movieDetailPagePresentation: MovieDetailPagePresentation?
    
    init(view: SearchViewProtocol?, router: SearchViewRouterProtocol?, interactor: SearchViewInteractorProtocol?) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func getSearchRepo(text: String?){
        interactor?.searchRepoRequest(text: text)
    }
    
    override func onErrorPopup(errorString: String) {
        super.onErrorPopup(errorString: errorString)
        self.view?.activeSearchBar()
    }
}
extension SearchViewPresenter: SearchViewInteractorOutputProtocol {
    override func showLoading(isLoad: Bool) {
        view?.showLoading(isLoad: isLoad)
    }
    
    func onSuccessRepoList(repoDTOList: [RepoDTO]?) {
        self.view?.activeSearchBar()
        if let repoDTOList = repoDTOList{
            let repoPrensetationList = repoDTOList.map{RepoPresentation(repoDTO: $0)}
            view?.reloadUIData(repoPresentationList: repoPrensetationList)
        }else{
            view?.noDataVisible()
        }
    }
}
