//
//  ContentView.swift
//  Memorize
//
//  Created by Jacob Flores on 9/13/24.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: Array<String> = []
    @State var cardCount: Int = 4
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle).fontWeight(.heavy).shadow(radius: 10, x: 10, y: 10)
            HStack{
                cards
            }
            Spacer()
            themeChangers
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum:80))]){
            ForEach(0..<emojis.count, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var themeChangers: some View{
        HStack{
            halloweenTheme
            Spacer()
            vehicleTheme
            Spacer()
            foodTheme
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func themeChanger(theme: [String], themeButton: String) -> some View{
        Button(action: {
            emojis = theme.shuffled()
        }, label:{
            Text(themeButton)
        })
    }
    
    var halloweenTheme: some View{
        themeChanger(theme: ["👻","👻","💀","💀","🕸️","🕸️","🕷️","🕷️","🧙🏻‍♀️","🧙🏻‍♀️","🐺","🐺", "🙀" ,"🙀" ,"🍭", "🍭"], themeButton: "👻")
    }
    var vehicleTheme: some View{
        themeChanger(theme: ["🚘","🚘","🚔","🚔","🚚","🚚","🏎️","🏎️","🚑","🚑","🚜","🚜", "🚎" ,"🚎" ,"🛵", "🛵"], themeButton: "🚘")
    }
    
    var foodTheme: some View{
        themeChanger(theme: ["🍔","🍔","🌮","🌮","🌭","🌭","🍟","🍟","🍙","🍙","🍜","🍜", "🍕" ,"🍕" ,"🍗", "🍗"], themeButton: "🍔")
    }
    
    
    
        
}

struct CardView: View{
    let content: String
    
    @State var isFaceUp = false
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
