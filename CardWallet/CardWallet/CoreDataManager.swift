//
//  CoreDataManager.swift
//  CardWallet
//
//  Created by Ania Kuliś on 21.02.2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class UserStore {
    
    static let shared = UserStore()
    
    var loggedUserName: String?
    
    private init() {}

}

public class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
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
    
    private func saveContext(_ context: NSManagedObjectContext) {
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
    
    func saveUser(login: String, password: String, email: String?) {
        let context = persistentContainer.newBackgroundContext()
        context.perform {
            let entity = NSEntityDescription.entity(forEntityName: "UsereEntity", in: context)
            let user = UsereEntity.init(entity: entity!, insertInto: context)
            user.name = login
            user.password = password
            user.email = email
            self.saveContext(context)
        }
    }
    
    func fetchUser(named: String, password: String) -> Bool {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<UsereEntity> = UsereEntity.fetchRequest()
        let namePredicate = NSPredicate(format: "%K = %@", #keyPath(UsereEntity.name), named)
        let passwordPredicate = NSPredicate(format: "%K = %@", #keyPath(UsereEntity.password), password)
        let finalPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [namePredicate, passwordPredicate])
        fetchRequest.predicate = finalPredicate
        if let result = try? context.fetch(fetchRequest) {
            return !result.isEmpty
            //return result
        }
        return false
    }
    
    func saveCard(named: String, number: String, imageData: UIImage) {
        let context = persistentContainer.viewContext
        context.perform {
            let entity = NSEntityDescription.entity(forEntityName: "CardEntity", in: context)
            let card = CardEntity.init(entity: entity!, insertInto: context)
            card.name = named
            card.number = Int64(number) ?? Int64(UUID().hashValue)
            card.imageData = UIImagePNGRepresentation(imageData)
            self.saveContext(context)
        }
    }
    
    
    func fetchCard() -> [CardEntity] {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"CardEntity")
        //var availableCards: [CardEntity] = []
        
        if let result = try? context.fetch(request) as! [CardEntity] {
            print ("done")
            return result
        }

        return []
    }

    
    
}

