//
//  CardImageTableViewCell.swift
//  CardWallet
//
//  Created by Ania Kuliś on 26.01.2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import UIKit

class CardImageTableViewCell: UITableViewCell {

    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
