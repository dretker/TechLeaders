//
//  CardNumberTableViewCell.swift
//  CardWallet
//
//  Created by Ania Kuliś on 26.01.2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import UIKit


protocol CardNumberTableViewCellDelegate: class {
    func didFillCardNumber(_ cardNumber: String)
}

class CardNumberTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var number: UITextField!
    
    weak var delegate: CardNumberTableViewCellDelegate?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        delegate = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        guard let text = textField.text, !text.isEmpty else { return }
        delegate?.didFillCardNumber(text)
    }
    
}
