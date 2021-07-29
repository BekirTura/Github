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
    private var repoList:[RepoPresentation]?
  //  var movieDetailPagePresentation: MovieDetailPagePresentation?
    
    init(view: SearchViewProtocol?, router: SearchViewRouterProtocol?, interactor: SearchViewInteractorProtocol?) {
        self.view = view
        self.router = router
        self.interactor = interactor
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
        if let repoDTOList = repoDTOList, repoDTOList.count > 0{
            let repoPrensetationList = repoDTOList.map{RepoPresentation(repoDTO: $0)}
            self.repoList = repoPrensetationList
            view?.reloadUIData(repoPresentationList: repoPrensetationList)
        }else{
            view?.noDataVisible()
        }
    }
}

extension SearchViewPresenter: SearchViewPresenterProtocol{
    func selectProfil(name: String) {
        router?.navigateToUserDetail(name: name)
    }
    
    func selectRepo(index:Int) {
        if let repo = repoList?[index]{
            router?.navigateToRepoDetail(repo: repo)
        }
    }
    
    
    func getSearchRepo(text: String?){
        interactor?.searchRepoRequest(text: text)
    }
    
    func reset()  {
        self.repoList?.removeAll()
        self.repoList = nil
        view?.initView()
    }
}
