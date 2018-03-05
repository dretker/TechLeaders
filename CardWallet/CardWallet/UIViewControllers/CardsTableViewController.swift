//
//  CardsTableViewController.swift
//  CardWallet
//
//  Created by Grzegorz Przybyła on 09/01/2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import UIKit
import CoreData

class CardsTableViewController: UITableViewController {
    
    var cards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleCards()
        title = "Your cards"
        let addCardButton = navigationItem.rightBarButtonItem
        addCardButton?.target = self
        addCardButton?.action = #selector(didTapAddCardButton(_:))
        
        self.tableView.allowsSelection = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSampleCards()
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
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        
        
        let destination = EditCardTableViewController() // Your destination
        navigationController?.pushViewController(destination, animated: true)
        
    }
    
    
    
    
    @objc private func didTapAddCardButton(_ sender: AnyObject) {
        guard let addCardController = storyboard?.instantiateViewController(withIdentifier: "SingleCardTableViewController") as? SingleCardTableViewController else { return }
        let navigationController = UINavigationController(rootViewController: addCardController)
        present(navigationController, animated: true, completion: nil)
    }
    
    // fetch cards for user named
    private func loadSampleCards() {
        // core data fetch request
        
        let coreDataManager = CoreDataManager.shared
        let availableCards = coreDataManager.fetchCard()
        
        let cards = availableCards.map{CardEntity in Card(name: CardEntity.name!, number: String(CardEntity.number)) }
        
        self.cards = cards
        self.tableView.reloadData()

        /*
        let card1 = Card(name:"Karta 1", number: "1")
        
        let card2 = Card(name:"Karta 2", number: "2")
        
        let card3 = Card(name:"Karta 3", number:"3")
        
        let card4 = Card(name: "42", number: "373")
 
        cards += [card1, card2, card3, card4]
 */
     
        
    
        
     /*   let coreDataManager = CoreDataManager.shared
        if coreDataManager.fetchCard(name: CardNameTableViewCell.name, number: CardNumberTableViewCell.number){
            //info, that card is already in db
            let alert = UIAlertController(title: "Info:", message: "That card is already saved", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            //if not, we add new card to the list
            let addCard = (CardNameTableViewCell.name, CardNumberTableViewCell.number, CardImageTableViewCell.image)
            CoreDataManager.saveCard(named: name, number: number, photo: image)
            cards += [addCard]
 
        }*/
        
        
        
        
    }
    
}
