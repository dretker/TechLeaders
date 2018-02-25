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
        number.delegate = self
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        delegate?.didFillCardNumber(text)
        return true
    }
    
}
