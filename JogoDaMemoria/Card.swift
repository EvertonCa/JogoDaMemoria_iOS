//
//  Card.swift
//  JogoDaMemoria
//
//  Created by Everton Cardoso on 13/05/2018.
//  Copyright © 2018 Everton Cardoso. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int
    {
        identifierFactory += 1
        return identifierFactory
    }
    
    init()
    {
        self.identifier = Card.getUniqueIdentifier()
    }
}
