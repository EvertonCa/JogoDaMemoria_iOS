//
//  JogoDaMemoria.swift
//  JogoDaMemoria
//
//  Created by Everton Cardoso on 13/05/2018.
//  Copyright © 2018 Everton Cardoso. All rights reserved.
//

import Foundation

class JogoDaMemoria
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int)
    {
        if !cards[index].isMatched
        {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index
            {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else{
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices
                {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    func checkIfGameEnded() -> Bool
    {
        var ended = true
        for index in cards.indices
        {
            if !cards[index].isMatched
            {
                ended = false
            }
        }
        return ended
    }
    
    init(numberOfPairsOfCards: Int)
    {
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        // TODO: shuffle cards
        cards.shuffle()
    }
}

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    /// Returns an array with the contents of this sequence, shuffled.
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
