//
//  CoreDataManager.swift
//  CardWallet
//
//  Created by Ania Kuliś on 21.02.2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataManager{
    
    
    
    private var cardName: String
    private var cardNumber: Int
    private var cardImage: Data?
    
    
    init(cardName: String, cardNumber: Int, cardImage: Data){
        self.cardName = cardName
        self.cardNumber = cardNumber
        self.cardImage = cardImage
    }
    

    
    
}
