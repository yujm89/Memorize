//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jacob Flores on 10/15/24.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private static var theme = getTheme()
    
    private static func getTheme() -> Themes {
        return Themes(index: Int.random(in: 0...1))
    }
    
    private static func createMemoryGame(_ cardTheme: Themes) -> MemoryGame<String> {
        return MemoryGame(numberOfPairsofCards: 8){ pairIndex in
            if cardTheme.theme.indices.contains(pairIndex){
                return cardTheme.theme[pairIndex]
            }else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame(getTheme())

    
        
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func newGame(){
        model = EmojiMemoryGame.createMemoryGame(EmojiMemoryGame.getTheme())
    }
    
    
}
