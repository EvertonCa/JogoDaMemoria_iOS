//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Everton Cardoso on 12/05/2018.
//  Copyright © 2018 Everton Cardoso. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    private lazy var game = JogoDaMemoria(numberOfPairsOfCards: numberOfPairsOfCards )
    
    var numberOfPairsOfCards: Int
    {
        return (cardButtons.count + 1) / 2
        
    }
    
    private(set) var flipCount = 0
    {
        didSet
        {
            updateLabels()
        }
    }
    
    private func updateLabels()
    {
        let attributes:[NSAttributedStringKey:Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        ]
        let attributedStringFlips = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedStringFlips
        
        if record != nil
        {
            let attributedStringRecord = NSAttributedString(string: "Record: \(record!)", attributes: attributes)
            recordLabel.attributedText = attributedStringRecord
        }
        
    }
    
    private func createRecordLabel()
    {
        let attributes:[NSAttributedStringKey:Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        ]
        let attributedStringRecord = NSAttributedString(string: "Record: ∞", attributes: attributes)
        recordLabel.attributedText = attributedStringRecord
    }
    
    var record: Int?
    {
        didSet
        {
            updateLabels()
        }
    }

    @IBOutlet private weak var flipCountLabel: UILabel!
    {
        didSet
        {
            updateLabels()
        }
    }
    
    @IBOutlet private weak var recordLabel: UILabel!
    {
        didSet
        {
            if record == nil
            {
                createRecordLabel()
            }
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton)
    {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender)
        {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            if game.checkIfGameEnded()
            {
                if record == nil || record! > flipCount
                {
                    record = flipCount
                }
                
                game = JogoDaMemoria(numberOfPairsOfCards: (cardButtons.count + 1) / 2 )
                emojiChoices = "😀😇😍😎😡😭😶😳"
                flipCount = 0
                updateViewFromModel()
            }
        }
    }
    
    private func updateViewFromModel()
    {
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp
            {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            }
            else
            {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            }
        }
    }
    
    // private var emojiChoices = ["😀","😇","😍","😎","😡","😭","😶","😳"]
    
    private var emojiChoices = "😀😇😍😎😡😭😶😳"
    
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String
    {
        if emoji[card] == nil, emojiChoices.count > 0
        {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
            
        }
        return emoji[card] ?? "?"
    }

}

extension Int
{
    var arc4random: Int
    {
        if self > 0
        {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0
        {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else
        {
            return 0
        }
    }
}

