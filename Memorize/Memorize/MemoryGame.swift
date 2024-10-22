//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jacob Flores on 10/15/24.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    init(numberOfPairsofCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        //add numberOfPairsofCards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairsofCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
