//
//  ProfilDetailViewController.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import UIKit

class ProfilDetailViewController: BaseViewController {
    
    //MARK:  START -- IBOutlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgProfile: BaseImageView!
    @IBOutlet weak var tbvRepos: UITableView!
    //MARK:  END -- IBOutlets
    
    var repos:[RepoPresentation]?
    var presenter: ProfilDetailViewPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        presenter?.getUserProfile()
        presenter?.getUserProfileRepo()
    }

    func prepareTableView(){
        self.tbvRepos.registerNib(cell: SearchCell.self)
        self.tbvRepos.dataSource = self
        self.tbvRepos.delegate = self
    }

}

//MARK: ProfilDetailViewProtocol
extension ProfilDetailViewController: ProfilDetailViewProtocol{
    func reloadUserData(user: UserPresentation) {
        self.lblName.text = user.name
        self.lblEmail.text = user.email
        self.lblUserName.text = user.username
        self.imgProfile.setImage(fromString: user.imageUrl)
    }
    
    func reloadUserRepoData(repoList: [RepoPresentation]) {
        self.repos = repoList
        self.tbvRepos.reloadData()
    }
  
}

//MARK: ProfilDetailViewProtocol
extension ProfilDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: SearchCell.self, for: indexPath) as! SearchCell
        cell.setUIData(repo: repos![indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    
}
