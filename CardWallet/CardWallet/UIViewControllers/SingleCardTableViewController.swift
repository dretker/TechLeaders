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
    }
    
    static let storyboardID = "SingleCardTableViewController"
    
    weak var delegate: SingleCardTableViewControllerDelegate?
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
        let card = Card(name: cardName, number: cardNumber)
        delegate?.didCreateCard(card)
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
    
    //view of cells
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        //let cellIdentifier = "SingleCardTableViewCell"
        
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NameLabelViewCell")
            return cell!
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardNameViewCell")
            return cell!
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NumberLabelViewCell")
            return cell!
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardNumberViewCell")
            return cell!
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardImageViewCell")
            return cell!
            
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoButtonViewCell")
            return cell!
            
        default:
            return UITableViewCell()
        }

    }
    
    
    
    
}

extension SingleCardTableViewController: CardNameTableViewCellDelegate {
    
    func didFillCardName(_ cardName: String) {
        newCard.name = cardName
    }
    
}

