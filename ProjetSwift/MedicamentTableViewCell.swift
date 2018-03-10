//
//  MedicamentTableViewCell.swift
//  ProjetSwift
//
//  Created by Sheena Maucuer on 10/03/2018.
//  Copyright © 2018 Vincent HERREROS. All rights reserved.
//

import UIKit

class MedicamentTableViewCell: UITableViewCell {

    @IBOutlet weak var nomMedicament: UILabel!
    @IBOutlet weak var dose: UILabel!
    @IBOutlet weak var unite: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
