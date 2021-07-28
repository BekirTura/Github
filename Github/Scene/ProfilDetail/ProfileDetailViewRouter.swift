//
//  ProfileDetailRouter.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import UIKit
final class ProfilDetailViewRouter {
    weak var navigationController: UINavigationController?
    
    init(with navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    static func createModule(using navigationController: UINavigationController? = nil, name: String! = nil) -> ProfilDetailViewController {
        
        let view = ProfilDetailViewController.init()
        let router = ProfilDetailViewRouter(with: navigationController)
        let interactor = ProfilDetailViewInteractor()
        let presenter = ProfilDetailViewPresenter(view: view, router: router, interactor: interactor, name: name)
        
        view.presenter = presenter
        interactor.output = presenter
        
        return view
    }
    
}

extension ProfilDetailViewRouter: ProfilDetailViewRouterProtocol {

    
   
}
