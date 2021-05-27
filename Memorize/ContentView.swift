//
//  ContentView.swift
//  Memorize
//
//  Created by Benjamin McEnulty on 5/25/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚕", "🚗", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐",
                  "🚚", "🚛", "🚜", "🛺", "🚃", "🚢", "🚂", "🛵", "🚤", "🎠",
                  "🚁", "🚠", "🛶", "⛵️" ]
    
    //Starting # of emoji cards to display, able to change due to @State
    @State var emojiCount = 5
    
    var body: some View {
        VStack {
            
            //Prevents view from growing and taking over other views
            ScrollView {
                
                //Organized grid of views that will change size to fit space
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    
                    //View that iterates over a # of items, creating a subview for each
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            
            //Bottom row of buttons to modify emojiCount
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

//Defines appearance of individual cards in game
struct CardView: View {
    
    //Emoji to display in card
    var content: String
    
    //Used to toggle between 'front' and 'back' of card
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            //Reused view that is assigned to constant for simplicity
            let shape = RoundedRectangle(cornerRadius: 20)
            
            //Appearance will change automatically when @State Bool is changed
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}













struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
