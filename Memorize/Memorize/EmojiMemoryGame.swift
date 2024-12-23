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
        return Themes(index: Int.random(in: 0...5))
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
    
    @Published private var model = createMemoryGame(theme)

    
        
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    func getColor() -> Color{
        let color = EmojiMemoryGame.theme.getColor()
        switch color {
        case "orange":
            return .orange
        case "blue":
            return .blue
        case "red":
            return .red
        case "green":
            return .green
        case "yellow":
            return .yellow
        case "purple":
            return .purple
        default:
            return.gray
        }
    }
    
    func getScore() -> Int{
        return model.getScore()
    }
    
    func getTheme() -> String{
        return EmojiMemoryGame.theme.getTheme()
    }
    
    // MARK: - Intents
    
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func newGame(){
        EmojiMemoryGame.theme = EmojiMemoryGame.getTheme()
        model = EmojiMemoryGame.createMemoryGame(EmojiMemoryGame.theme)
    }
    

    
    
}
