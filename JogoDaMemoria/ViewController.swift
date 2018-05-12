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
    var flipCount = 0
    {
        didSet
        {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["😀","😇","😍","😎","😡","😭","😶","😳","😀","😇","😍","😎","😡","😭","😶","😳"]
    
    @IBAction func touchCard(_ sender: UIButton)
    {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender)
        {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
    }
    
    func flipCard(withEmoji emoji: String, on button:UIButton)
    {
        if button.currentTitle == emoji
        {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        }
        else
        {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }

}

