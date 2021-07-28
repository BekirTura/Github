//
//  SearchCell.swift
//  Github
//
//  Created by Emrah Akgül on 25.01.2021.
//

import UIKit
import Kingfisher

protocol SearchCellDelegate: class {
    func onClickAvatar(at index: Int)
}

final class SearchCell: UITableViewCell {
    

    //MARK:  START -- IBOutlets
    @IBOutlet private weak var lblRepoName: UILabel!
    @IBOutlet private weak var lblOwnerName: UILabel!
    @IBOutlet private weak var imgAvatar: UIImageView!
    @IBOutlet private weak var btnAvatar: UIButton!
    //MARK:  END -- IBOutlets
    
    var index: Int!
    weak var delegate: SearchCellDelegate?
    
    
    func setUIData(repo:RepoPresentation){
        self.lblRepoName.text = repo.repoName
        self.lblOwnerName.text = repo.ownerName
        self.imgAvatar.setImage(fromString: repo.imageUrl)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction private func onClickAvatar() {
        delegate?.onClickAvatar(at: index)
    }
}
