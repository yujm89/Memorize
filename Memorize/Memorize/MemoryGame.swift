//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jacob Flores on 10/15/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: [Card]
    var score = 0
    
    init(numberOfPairsofCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = []
        //add numberOfPairsofCards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairsofCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
        cards.shuffle()
        cards.shuffle()
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get{ return cards.indices.filter {index in cards[index].isFaceUp}.only}
        set{ cards.indices.forEach {cards[$0].isFaceUp = (newValue == $0)}}
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}){
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        score += 2
                    }
                    else{
                        score -= 1
                    }
                }else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                
                
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        
        var debugDescription: String{
            return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
        
    }
}
    
extension Array{
    var only: Element?{
        return count == 1 ? first : nil
    }
}

