//
//  SearchViewController.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import UIKit

class SearchViewController: BaseViewController {
    
    //MARK:  START -- IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var vwNoData: UIView!
    @IBOutlet weak var tbvRepoList: UITableView!
    //MARK:  END -- IBOutlets

    var repoList:[RepoPresentation]?
    
    var presenter: SearchViewPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        prepareTableView()
        // Do any additional setup after loading the view.
    }
    
    func prepareTableView(){
        self.tbvRepoList.registerNib(cell: SearchCell.self)
        self.tbvRepoList.dataSource = self
        self.tbvRepoList.delegate = self
    }

}

//MARK: SearchViewProtocol
extension SearchViewController: SearchViewProtocol{
    func activeSearchBar() {
        self.searchBar.isUserInteractionEnabled = true
    }
    
    func noDataVisible() {
        self.vwNoData.isHidden = false
        self.tbvRepoList.isHidden = true
    }
    
    func reloadUIData(repoPresentationList: [RepoPresentation]) {
        self.repoList  = repoPresentationList
        self.vwNoData.isHidden = true
        self.tbvRepoList.isHidden = false
        self.tbvRepoList.reloadData()
    }

}


//MARK: UITableViewDelegate, UITableViewDataSource
extension SearchViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: SearchCell.self, for: indexPath) as! SearchCell
        cell.setUIData(repo: repoList![indexPath.row])
        cell.index = indexPath.row
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectRepo(index: indexPath.row)
    }
    
    
}

//MARK: UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText.count > 2){
            self.searchBar.isUserInteractionEnabled = false
            presenter?.getSearchRepo(text: searchText)
        }
    }
}


extension SearchViewController: SearchCellDelegate{
    func onClickProfile(at index: Int) {
        if let name = repoList?[index].ownerName{
            presenter?.selectProfil(name: name)
        }
    }
    
}
