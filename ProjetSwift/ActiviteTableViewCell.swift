//
//  ActiviteTableViewCell.swift
//  ProjetSwift
//
//  Created by Bottero Alexandre  on 12/03/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import UIKit

class ActiviteTableViewCell: UITableViewCell {

    @IBOutlet weak var labelDone: UILabel!
    @IBOutlet weak var labelActivite: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
