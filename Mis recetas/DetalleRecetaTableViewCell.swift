//
//  DetalleRecetaTableViewCell.swift
//  Mis recetas
//
//  Created by MacMiniDev on 12/27/18.
//  Copyright © 2018 Ziette. All rights reserved.
//

import UIKit

class DetalleRecetaTableViewCell: UITableViewCell {

    @IBOutlet var keyLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
