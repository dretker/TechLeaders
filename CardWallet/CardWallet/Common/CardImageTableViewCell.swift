//
//  CardImageTableViewCell.swift
//  CardWallet
//
//  Created by Ania Kuliś on 12.02.2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import UIKit



class CardImageTableViewCell: UITableViewCell, UIPickerViewDelegate {
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    func setupImage(image: UIImage?) {
        cardImageView.image = image
    }
    

    

    
}
