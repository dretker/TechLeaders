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
    
    static let storyboardID = "SingleCardTableViewController"
    
    weak var delegate: SingleCardTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSaveButton(_:)))
        navigationItem.rightBarButtonItem = button
        
        let dismissButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(didTapDismissButton(_:)))
        navigationItem.leftBarButtonItem = dismissButton
    }
    
    
    @objc func didTapSaveButton(_ button: UIButton) {
        let card = Card(name: "CardName", number: 42)
        delegate?.didCreateCard(card)
    }
    
    @objc func didTapDismissButton(_ button: UIButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
}

