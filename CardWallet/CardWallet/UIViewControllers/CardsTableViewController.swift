//
//  CardsTableViewController.swift
//  CardWallet
//
//  Created by Grzegorz Przybyła on 09/01/2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import UIKit

class CardsTableViewController: UITableViewController {
    
    var cards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleCards()
        title = "Your cards"
        let addCardButton = navigationItem.rightBarButtonItem
        addCardButton?.target = self
        addCardButton?.action = #selector(didTapAddCardButton(_:))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        let cellIdentifier = "CardTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CardTableViewCell else {
            fatalError("The dequed cell is not an instance of CardTableViewCell.")
        }
        
        let card = cards[indexPath.row]
        
        cell.cardName.text = card.name
        let numberX = String(card.number)
        cell.cardNr.text = numberX
        
        return cell
    }
    
    @objc private func didTapAddCardButton(_ sender: AnyObject) {
        guard let addCardController = storyboard?.instantiateViewController(withIdentifier: "SingleCardTableViewController") as? SingleCardTableViewController else { return }
        addCardController.delegate = self
        let navigationController = UINavigationController(rootViewController: addCardController)
        present(navigationController, animated: true, completion: nil)
    }
    
    
    private func loadSampleCards() {
        
        let card1 = Card(name:"Karta 1", number: 1)
        
        let card2 = Card(name:"Karta 2", number: 2)
        
        let card3 = Card(name:"Karta 3", number:3)
        
        let card4 = Card(name: "42")
        
        cards += [card1, card2, card3, card4]
    }
    
}

extension CardsTableViewController: SingleCardTableViewControllerDelegate {
    
    func didCreateCard(_ card: Card) {
        cards.append(card)
        tableView.reloadData()
    }
    
}
