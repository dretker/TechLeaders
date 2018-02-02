//
//  CardStruct.swift
//  CardWallet
//
//  Created by Ania Kuliś on 22.01.2018.
//  Copyright © 2018 Ania Kulis. All rights reserved.
//

import Foundation

struct Card {
    
    let name: String
    let number: String
    
    
    init(name: String, number: String){
        self.name = name
        self.number = number
    }
    
/*    init(name: String) {
        self.name = name
        self.number = UUID().hashValue
    }*/
    
}
