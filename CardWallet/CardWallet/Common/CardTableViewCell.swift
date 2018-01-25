//
//  CardTableViewCell.swift
//  CardWallet
//
//  Created by Ania Kuliś on 10.01.2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardNr: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
