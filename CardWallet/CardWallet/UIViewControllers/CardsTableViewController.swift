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
    
    lazy var fetchedResultController: NSFetchedResultsController<CardEntity> = {
        let fetchRequest: NSFetchRequest<CardEntity> = CardEntity.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "number", ascending: true)]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataManager.shared.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = self
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Your cards"
        let addCardButton = navigationItem.rightBarButtonItem
        addCardButton?.target = self
        addCardButton?.action = #selector(didTapAddCardButton(_:))
        
        self.tableView.allowsSelection = true
        
        do {
            try fetchedResultController.performFetch()
        } catch {
            let fetchError = error as NSError
            print("\(fetchError), \(fetchError.userInfo)")
        }
        
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
        return fetchedResultController.sections?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultController.sections?[section].objects?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        let cellIdentifier = "CardTableViewCell"
        
        guard let cardEntity = fetchedResultController.fetchedObjects?[indexPath.item] else {
            fatalError("Invalid card fetched")
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CardTableViewCell else {
            fatalError("The dequed cell is not an instance of CardTableViewCell.")
        }
        
        let card = mapCard(cardEntity)
        
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
    
    private func mapCard(_ cardEntity: CardEntity) -> Card {
        return Card(name: cardEntity.name!, number: String(cardEntity.number))
    }
    
    // fetch cards for user named
    private func loadSampleCards() {
        // core data fetch request
        
        let coreDataManager = CoreDataManager.shared
        let availableCards = coreDataManager.fetchCard()
        
        let cards = availableCards.map(mapCard)
        
        self.cards = cards
        self.tableView.reloadData()
        
    }
    
}

extension CardsTableViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath {
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
            }
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }

}
