//
//  SearchCell.swift
//  Github
//
//  Created by Emrah Akgül on 25.01.2021.
//

import UIKit
import Kingfisher

protocol SearchCellDelegate: class {
    func onClickProfile(at index: Int)
}

final class SearchCell: UITableViewCell {
    

    //MARK:  START -- IBOutlets
    @IBOutlet private weak var lblRepoName: UILabel!
    @IBOutlet private weak var lblOwnerName: UILabel!
    @IBOutlet private weak var imgAvatar: UIImageView!
    @IBOutlet private weak var btnAvatar: UIButton!
    @IBOutlet weak var lblWatchedCount: UILabel!
    @IBOutlet weak var lblForkCount: UILabel!
    @IBOutlet weak var lblProgrammingLanguage: UILabel!
    //MARK:  END -- IBOutlets
    
    var index: Int!
    weak var delegate: SearchCellDelegate?
    
    
    func setUIData(repo:RepoPresentation){
        self.lblRepoName.text = repo.repoName
        self.lblOwnerName.text = repo.ownerName
        self.imgAvatar.setImage(fromString: repo.imageUrl)
        self.lblForkCount.text = "\(String(describing: repo.forksCount ?? 0))"
        self.lblWatchedCount.text = "\(String(describing: repo.watchersCount ?? 0))"
        self.lblProgrammingLanguage.text = repo.programmingLanguage
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction private func onClickAvatar() {
        delegate?.onClickProfile(at: index)
    }
}
