//
//  ContentView.swift
//  Memorize
//
//  Created by Jacob Flores on 9/13/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle).fontWeight(.heavy).shadow(radius: 10, x: 10, y: 10).padding().foregroundStyle(viewModel.getColor())
            HStack{
                Text("Currently: \(viewModel.getTheme())")
                Spacer()
                Text("Score: \(viewModel.getScore()) ").font(.title3)
            }
            
            HStack{
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Spacer()
            Button("New Game"){
                viewModel.newGame()
            }
            .padding()
            .font(.title)
            
            
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards){ card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(viewModel.getColor())
    }
}

struct CardView: View{
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}




struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
