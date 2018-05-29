//
//  JogoDaMemoriaThemeChooserViewController.swift
//  JogoDaMemoria
//
//  Created by Everton Cardoso on 29/05/2018.
//  Copyright © 2018 Everton Cardoso. All rights reserved.
//

import UIKit

class JogoDaMemoriaThemeChooserViewController: UIViewController
{
    let theme = [
        "Sports" : "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓🏸🥅🏒⛳️🏹",
        "Animals":"🐶🐱🐭🐹🐰🦊🐻🐼🐨🐯🦁🐮🐷🐸",
        "Faces" : "😀😆😅😂🤣😇😍😌😋😛😎🧐🤪😢"
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "Choose Theme"
        {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = theme[themeName]
            {
                if let jdmvc = segue.destination as? JogoDaMemoriaViewController
                {
                    jdmvc.theme = theme
                }
            }
        }
    }
    

}
