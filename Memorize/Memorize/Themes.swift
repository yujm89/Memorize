//
//  Themes.swift
//  Memorize
//
//  Created by Jacob Flores on 10/26/24.
//

import Foundation

struct Themes {
    let cardThemes: [[String]] = [["👻","💀","🕸️","🕷️","🧙🏻‍♀️","🐺","🙀","🧟"], ["🚕","🚎","🏎️","🚓","🚚","🚙","🛺", "🚑"],
        ["🍔","🍕","🍟","🌭","🌮","🌯","🍩", "🥓"]]
    let theme: [String]
    
    
    init(index: Int){
        theme = cardThemes[index]
    }
    
}
