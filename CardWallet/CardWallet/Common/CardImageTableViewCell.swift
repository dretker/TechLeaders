//
//  CardImageTableViewCell.swift
//  CardWallet
//
//  Created by Ania Kuliś on 12.02.2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import UIKit

protocol CardImageTableViewCellDelegate: class {
    func didFillCardImage(_ cardImage: UIImage)
}

class CardImageTableViewCell: UITableViewCell, UIPickerViewDelegate {
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    func setupImage(image: UIImage?) {
        cardImageView.image = image
    }
    
    
    weak var delegate: CardImageTableViewCellDelegate?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        delegate = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardImageView.delegate = self
    }
    
    func imageField(_ imageField: UIImage, shouldChangeCharactersIn range: NSRange, replacementString data: Data) -> Bool {
        let image = (imageField as  NSData).replacingCharacters(in: range, with: data)
        delegate?.didFillCardImage(image)
        return true
    }

    
    
    
    
}
