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
    
    
    @objc func didTapSaveButton(_ button: UIButton) {
        guard let cardName = newCard.name,
            let cardNumber = newCard.number else {
                print("Saving cards before filled all card info")
                return
        }
        let card = Card(name: cardName, number: cardNumber)
        delegate?.didCreateCard(card)
    }
    
    @objc func didTapDismissButton(_ button: UIButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
}

extension SingleCardTableViewController: CardNameTableViewCellDelegate {
    
    func didFillCardName(_ cardName: String) {
        newCard.name = cardName
    }
    
}

