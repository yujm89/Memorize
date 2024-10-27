//
//  Themes.swift
//  Memorize
//
//  Created by Jacob Flores on 10/26/24.
//

import Foundation

struct Themes {
    private let cardThemes: [[String]] = [["👻","💀","🕸️","🕷️","🧙🏻‍♀️","🐺","🙀","🧟"], ["🚕","🚎","🏎️","🚓","🚚","🚙","🛺", "🚑"],
        ["🍔","🍕","🍟","🌭","🌮","🌯","🍩", "🥓"],
        ["🧥","🥼","👖","👘","🩳","👕","👗", "👚"],
        ["🐆","🦍","🦓","🦣","🦘","🦧","🐖", "🦑"],
        ["⚽️","🏀","🏈","🎾","⚾️","🏐","🏒", "🏸"]]
    
    let ThemeName: String
    let numberOfCards = 8
    let theme: [String]
    let cardColor: String
    
    
    init(index: Int){
        theme = cardThemes[index]
        switch index {
        case 0: 
            ThemeName = "Halloween"
            cardColor = "orange"
        case 1:
            ThemeName = "Transportation"
            cardColor = "blue"
        case 2:
            ThemeName = "Food"
            cardColor = "red"
        case 3:
            ThemeName = "Clothing"
            cardColor = "green"
        case 4:
            ThemeName = "Animals"
            cardColor = "yellow"
        case 5:
            ThemeName = "Sports"
            cardColor = "purple"
        default:
            ThemeName = "Unknown"
            cardColor = "gray"
        }
    }
    
    func getColor() -> String {
        return cardColor
    }
    
    func getTheme() -> String {
        return ThemeName
    }
    
}
