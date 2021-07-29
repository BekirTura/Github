//
//  RepoDetailViewRouter.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//
import Foundation
import UIKit


final class RepoDetailViewRouter {
    weak var navigationController: UINavigationController?
    
    init(with navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule(using navigationController: UINavigationController? = nil,repo: RepoPresentation?) -> RepoDetailViewController {
        
        let view = RepoDetailViewController()
        let router = RepoDetailViewRouter(with: navigationController)
        let interactor = RepoDetailViewInteractor()
        let presenter = RepoDetailViewPresenter(view: view, router: router, interactor: interactor, repo: repo)
        
        view.presenter = presenter
        interactor.output = presenter
        
        return view
    }
    
}

extension RepoDetailViewRouter: RepoDetailViewRouterProtocol {

   
}
