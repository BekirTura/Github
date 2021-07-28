//
//  RepoDetailViewController.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import UIKit

class RepoDetailViewController: BaseViewController {

    var presenter: RepoDetailViewPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RepoDetailViewController: RepoDetailViewProtocol{
    func repoLoadUI(repo: RepoPresentation?) {
        self.navigationController?.title = repo?.repoName
    }
}
