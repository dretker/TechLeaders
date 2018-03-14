//
//  CardNameTableViewCell.swift
//  CardWallet
//
//  Created by Ania Kuliś on 26.01.2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import UIKit

/// Usage!
/// In UITableViewController in the method
/// tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
/// guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CardNameTableViewCell
/// Then put UITableViewController as a delegate of this cell
/// cell.delegate = self
protocol CardNameTableViewCellDelegate: class {
    func didFillCardName(_ cardName: String)
}

class CardNameTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    
    /// Please rename outlets to cover the type of the object
    /// e.g: @IBOutlet weak var nameTextFiled: UITextField!
    @IBOutlet weak var name: UITextField!
    
    weak var delegate: CardNameTableViewCellDelegate?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        delegate = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        name.delegate = self
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        delegate?.didFillCardName(text)
        return true
    }

}
