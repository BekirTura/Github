//
//  RepoDetailViewController.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import UIKit

class RepoDetailViewController: BaseViewController {

    //MARK:  START -- IBOutlets
    @IBOutlet private weak var lblRepoName: UILabel!
    @IBOutlet private weak var lblOwnerName: UILabel!
    @IBOutlet private weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblWatchedCount: UILabel!
    @IBOutlet weak var lblForkCount: UILabel!
    @IBOutlet weak var lblProgrammingLanguage: UILabel!
    //MARK:  END -- IBOutlets
    var presenter: RepoDetailViewPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getRepo()

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
        self.title = repo?.repoName
        self.lblRepoName.text = repo?.repoName
        self.lblOwnerName.text = repo?.ownerName
        self.imgAvatar.setImage(fromString: repo?.imageUrl)
        self.lblForkCount.text = "\(String(describing: repo?.forksCount ?? 0))"
        self.lblWatchedCount.text = "\(String(describing: repo?.watchersCount ?? 0))"
        self.lblProgrammingLanguage.text = repo?.programmingLanguage
    }
}
