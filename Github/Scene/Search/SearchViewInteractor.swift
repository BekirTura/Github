//
//  SearchViewInteractor.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
final class SearchViewInteractor:BaseViewInteractor {
    weak var output: SearchViewInteractorOutputProtocol?

}

extension SearchViewInteractor: SearchViewInteractorProtocol {
    
    enum SearchViewConstants {
        static let perPage = 10
    }
    func searchRepoRequest(text: String?) {
    
        guard let searchText = text, !searchText.isEmpty else { return }
        
        let textQuery = URLQueryItem(name: "q", value: text ?? "")
        let pageQuery = URLQueryItem(name: "page", value: String(1))
        let perPageQuery = URLQueryItem(name:"per_page" , value:String(SearchViewConstants.perPage))

        let parameters = [textQuery, pageQuery, perPageQuery]
        let searchReposRequest = SearchReposRequest(parameters: parameters, headers: [:])
        self.output?.showLoading(isLoad: true)
        restClient.sendRequest(searchReposRequest, BaseListDTO<[RepoDTO]>.self) { response in
            self.output?.showLoading(isLoad: false)
            self.output?.onSuccessRepoList(repoDTOList: response?.items)
        } failHandler: { error, errorString in
            self.output?.showLoading(isLoad: false)
        }
    }
}
