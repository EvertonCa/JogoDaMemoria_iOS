//
//  JogoDaMemoriaThemeChooserViewController.swift
//  JogoDaMemoria
//
//  Created by Everton Cardoso on 29/05/2018.
//  Copyright © 2018 Everton Cardoso. All rights reserved.
//

import UIKit

class JogoDaMemoriaThemeChooserViewController: UIViewController, UISplitViewControllerDelegate
{
    let theme = [
        "Sports" : "⚽️🏀🏈⚾️🎾🏐🏉🎱🏓🏸🥅🏒⛳️🏹",
        "Animals":"🐶🐱🐭🐹🐰🦊🐻🐼🐨🐯🦁🐮🐷🐸",
        "Faces" : "😀😆😅😂🤣😇😍😌😋😛😎🧐🤪😢"
    ]
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool
    {
        if let jdmvc = secondaryViewController as? JogoDaMemoriaViewController
        {
            if jdmvc.theme == nil
            {
                return true
            }
        }
        return false
    }
    
    @IBAction func changeTheme(_ sender: Any)
    {
        if let jdmvc = splitViewDetailJogoDaMemoriaViewController
        {
            if let themeName = ( sender as? UIButton )?.currentTitle, let theme = theme[themeName]
            {
                jdmvc.theme = theme
            }
        }
        else if let jdmvc = lastSeguedToJogoDaMemoriaViewController
        {
            if let themeName = ( sender as? UIButton )?.currentTitle, let theme = theme[themeName]
            {
                jdmvc.theme = theme
            }
            navigationController?.pushViewController(jdmvc, animated: true)
        }
        else
        {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    
    private var splitViewDetailJogoDaMemoriaViewController: JogoDaMemoriaViewController?
    {
        return splitViewController?.viewControllers.last as? JogoDaMemoriaViewController
    }
    
    private var lastSeguedToJogoDaMemoriaViewController: JogoDaMemoriaViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "Choose Theme"
        {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = theme[themeName]
            {
                if let jdmvc = segue.destination as? JogoDaMemoriaViewController
                {
                    jdmvc.theme = theme
                    lastSeguedToJogoDaMemoriaViewController = jdmvc
                }
            }
        }
    }
    

}
