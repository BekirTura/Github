//
//  SearchRepoCell.swift
//  Github
//
//  Created by Bekir on 28.07.2021.
//

import UIKit

class SearchRepoCell: UITableViewCell {
    
    
    //MARK:  START -- IBOutlets
    @IBOutlet  weak var lblRepoName: UILabel!
    @IBOutlet  weak var lblOwnerName: UILabel!
    @IBOutlet  weak var imgAvatar: UIImageView!
    @IBOutlet  weak var btnAvatar: UIButton!
    //MARK:  END -- IBOutlets

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUIData(repo:RepoPresentation){
        self.lblRepoName.text = repo.repoName
        self.lblOwnerName.text = repo.ownerName
        self.imgAvatar.setImage(fromString: repo.imageUrl)
    }
}
