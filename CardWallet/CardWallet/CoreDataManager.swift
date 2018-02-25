//
//  CoreDataManager.swift
//  CardWallet
//
//  Created by Ania Kuliś on 21.02.2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    // MARK: Setup
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CardModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("Saved")
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveCard(named: String, number: String, imageData: Data?) {
        let entity = NSEntityDescription.entity(forEntityName: "CardEntity", in: persistentContainer.viewContext)
        let card = CardEntity.init(entity: entity!, insertInto: persistentContainer.viewContext)
        card.name = named
        card.number = Int64(number) ?? Int64(UUID().hashValue)
        card.imageData = imageData
        saveContext()
    }
    
}
