//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jacob Flores on 10/15/24.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻","💀","🕸️","🕷️","🧙🏻‍♀️","🐺","🙀","🧟"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsofCards: 8){ pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            }else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
        
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
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    
}
