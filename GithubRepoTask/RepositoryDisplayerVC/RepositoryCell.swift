//
//  RepositoryCell.swift
//  Github Task
//
//  Created by Ali Jaber on 3/30/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import UIKit
import Kingfisher
class RepositoryCell: UITableViewCell {

    @IBOutlet weak public var repoNameLabel: UILabel!
    @IBOutlet weak public var repoDescriptionLabel: UILabel!
    @IBOutlet weak public var numberOfStarsLabel: UILabel!
    @IBOutlet weak public var usernameAndAvatarOwner: UILabel!
    
    @IBOutlet public weak var userAvatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    /// FILL CELL WITH DATA
    func fill(with repo: GithubRepository)  {
        if let fullName = repo.fullName, let descript = repo.descript, let name = repo.name,let avatarURL = repo.owner?.avatarURL {
            repoNameLabel.text = fullName
            repoDescriptionLabel.text = descript
            usernameAndAvatarOwner.text = "Username: " + name
            userAvatarImg.kf.indicatorType = .activity
            let url = URL(string: avatarURL)
            userAvatarImg.kf.setImage(with: url)
            setStarsFormat(with: repo.starAbbreviation)
        }
    }
    
    /// FILL STARS LABEL WITH TEXT AND STAR
    private func setStarsFormat(with repoStars: String) {
        self.numberOfStarsLabel.addStarToLabel(withText: repoStars)
    }
}
