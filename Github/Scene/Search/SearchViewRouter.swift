//
//  SearchViewRouter.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import Foundation
import UIKit


final class SearchViewRouter {
    weak var navigationController: UINavigationController?
    
    init(with navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule(using navigationController: UINavigationController? = nil) -> SearchViewController {
        
        let view = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        let router = SearchViewRouter(with: navigationController)
        let interactor = SearchViewInteractor()
        let presenter = SearchViewPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        interactor.output = presenter
        
        return view
    }
    
}

extension SearchViewRouter: SearchViewRouterProtocol {
    func navigateToUserDetail(name: String) {
        let view = ProfilDetailViewRouter.createModule(using: navigationController, name: name)
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func navigateToRepoDetail(repo:RepoPresentation){
        let view = RepoDetailViewRouter.createModule(using: navigationController, repo: repo)
        self.navigationController?.pushViewController(view, animated: true)
    }
}
