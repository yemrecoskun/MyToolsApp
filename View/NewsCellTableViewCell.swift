//
//  NewsCellTableViewCell.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 13.05.2021.
//

import UIKit

class NewsCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var storyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
