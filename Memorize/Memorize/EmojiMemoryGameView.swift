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
            Text("Memorize!").font(.largeTitle).fontWeight(.heavy).shadow(radius: 10, x: 10, y: 10).padding()
            HStack{
                cards
            }
            Spacer()
            Button("Shuffle"){
                viewModel.shuffle()
            }
            //themeChangers
            
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0){
            ForEach(viewModel.cards.indices, id: \.self){ index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.gray)
    }
    
//    var themeChangers: some View{
//        HStack(spacing: 20){
//            Spacer()
//            halloweenTheme
//            vehicleTheme
//            foodTheme
//            Spacer()
//        }
//        .padding()
//    }
//    
//    func themeChanger(theme: [String], themeButton: String, themeName: String) -> some View{
//        Button(action: {
//            emojis = theme.shuffled()
//        }, label:{
//            VStack{
//                Image(systemName: themeButton).font(.largeTitle)
//                Text(themeName).font(.title3)
//            }
//            .foregroundStyle(.gray)
//        })
//    }
//    
//    var halloweenTheme: some View{
//        themeChanger(theme: ["👻","👻","💀","💀","🕸️","🕸️","🕷️","🕷️","🧙🏻‍♀️","🧙🏻‍♀️","🐺","🐺", "🙀" ,"🙀" ,"🧟", "🧟"], themeButton: "figure.walk.circle", themeName: "Spooky")
//    }
//    var vehicleTheme: some View{
//        themeChanger(theme: ["🚘","🚘","🚔","🚔","🚚","🚚","🏎️","🏎️","🚑","🚑","🚜","🚜", "🚎" ,"🚎" ,"🛵", "🛵"], themeButton: "car", themeName: "Vehicles")
//    }
//    
//    var foodTheme: some View{
//        themeChanger(theme: ["🍔","🍔","🌮","🌮","🌭","🌭","🍟","🍟","🍙","🍙","🍜","🍜", "🍕" ,"🍕" ,"🍗", "🍗"], themeButton: "fork.knife", themeName: "Food")
//    }
    
    
    
        
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
    }
}




struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
