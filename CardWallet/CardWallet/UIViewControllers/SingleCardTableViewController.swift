//
//  SingleCardTableViewController.swift
//  CardWallet
//
//  Created by Grzegorz Przybyła on 25/01/2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import UIKit

protocol SingleCardTableViewControllerDelegate: class {
    func didCreateCard(_ card: Card)
}

class SingleCardTableViewController: UITableViewController {
    
    private class NewCard {
        var name: String?
        var number: String?
        var image: UIImage?
    }
    
    static let storyboardID = "SingleCardTableViewController"
    
    weak var delegate: SingleCardTableViewControllerDelegate?
    var coreDataManager = CoreDataManager.shared
    private var newCard = NewCard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Card"
        
        let button = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSaveButton(_:)))
        navigationItem.rightBarButtonItem = button
        
        let dismissButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(didTapDismissButton(_:)))
        navigationItem.leftBarButtonItem = dismissButton
    }
    
    
    @objc private func didTapSaveButton(_ button: UIButton) {
        guard let cardName = newCard.name,
            let cardNumber = newCard.number else {
                print("Saving cards before filled all card info")
                return
        }
        coreDataManager.saveCard(named: cardName, number: cardNumber, imageData: nil)
        navigationController?.dismiss(animated: true, completion: nil)

    }
    
    @objc func didTapDismissButton(_ button: UIButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        defer { cell?.separatorInset = UIEdgeInsets(top: 0, left: view.bounds.width, bottom: 0, right: 0) }
        switch indexPath.row{
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "NameLabelViewCell")
            return cell!
            
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "CardNameViewCell")
            (cell as? CardNameTableViewCell)?.delegate = self
            return cell!
            
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "NumberLabelViewCell")
            return cell!
            
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: "CardNumberViewCell")
            (cell as? CardNumberTableViewCell)?.delegate = self
            return cell!
            
        case 4:
            cell = tableView.dequeueReusableCell(withIdentifier: "CardImageViewCell")
            newCard.image.map {
                (cell as? CardImageTableViewCell)?.setupImage($0)
            }
            return cell!
            
        case 5:
            cell = tableView.dequeueReusableCell(withIdentifier: "PhotoButtonViewCell")
            (cell as? PhotoButtonTableViewCell)?.onButtonTap = { [weak self] in
                self?.pickImage()
            }
            return cell!
            
        default:
            return UITableViewCell()
        }

    }
    
    func pickImage() {
        // Display image picker controller
        let picker = UIImagePickerController()
        picker.delegate = self
        navigationController?.show(picker, sender: self)
    }
    
}

extension SingleCardTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("User cancelled")
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        defer { picker.dismiss(animated: true, completion: nil) }
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            newCard.image = image
            tableView.reloadData()
        }
    }
    
}

extension SingleCardTableViewController: CardNameTableViewCellDelegate {
    
    func didFillCardName(_ cardName: String) {
        newCard.name = cardName
    }
    
}

extension SingleCardTableViewController: CardNumberTableViewCellDelegate {

    func didFillCardNumber(_ cardNumber: String) {
        newCard.number = cardNumber
    }
    
}
