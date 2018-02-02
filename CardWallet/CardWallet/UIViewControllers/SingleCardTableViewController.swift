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
    

    
    @IBOutlet weak var cardName: UITextField!
    @IBOutlet weak var cardNumber: UITextField!
    
    
    
    
    static let storyboardID = "SingleCardTableViewController"
    
    weak var delegate: SingleCardTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Card"
        
        let button = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSaveButton(_:)))
        navigationItem.rightBarButtonItem = button
        
        let dismissButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(didTapDismissButton(_:)))
        navigationItem.leftBarButtonItem = dismissButton
    }
    
    
    @objc func didTapSaveButton(_ button: UIButton) {
        let card = Card(name: String(describing: cardName), number: String(describing: cardNumber))
        delegate?.didCreateCard(card)
    }
    
    @objc func didTapDismissButton(_ button: UIButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
}

