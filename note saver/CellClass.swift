//
//  CellClass.swift
//  note saver
//
//  Created by aidin on 7/31/18.
//  Copyright © 2018 aidin. All rights reserved.
//

import UIKit

class CellClass: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortDesLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
