//
//  ContentView.swift
//  Memorize
//
//  Created by Benjamin McEnulty on 5/25/21.
//

import SwiftUI

struct ContentView: View {
    let model = GameModel()
    
    //Starting # of emoji cards to display, able to change due to @State
    @State var emojiCount: Int
    
    @State var gameTheme: String
    
    @State var gameEmojis: [String]
    
    
    
    init() {
        emojiCount = Int.random(in: 8..<model.themes[0].emojis.count)
        gameTheme = model.themes[0].title
        gameEmojis = model.themes[0].emojis.shuffled()
    }
    
    
    
    var body: some View {
        
        //Needed for navigationBarTitle
        NavigationView {
            
            VStack {
                
                //Prevents view from growing and taking over other views
                ScrollView {
                    
                    //Organized grid of views that will change size to fit space
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: widthThatBestFits(cardCount: emojiCount)))]) {
                        
                        //View that iterates over a # of items, creating a subview for each
                        ForEach(gameEmojis[0..<emojiCount], id: \.self) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
                .foregroundColor(.red)
                
                Spacer()
                
                //MARK: Assignment 1, Task 4
                HStack {
                    //Adjusts to number of emoji themes in model
                    ForEach(model.themes[0..<model.themes.count], id:\.self) { theme in
                        //MARK: Assignment 1, Task 7
                        VStack {
                            //MARK: Assignment 1, Task 8
                            Image(systemName: theme.image)
                                .font(.largeTitle)
                            Text(theme.title)
                                .onTapGesture {
                                    if let emojis = model.themeDictionary[theme.title] {
                                        //MARK: Assignment 1, Task 6
                                        gameEmojis = emojis.shuffled()
                                        //MARK: Assignment 1, Task 5
                                        //MARK: Assignment 1, Extra Credit 1
                                        //Set random number of cards to show, minimum of 8
                                        emojiCount = Int.random(in: 8..<gameEmojis.count)
                                    }
                                }
                                //MARK: Assignment 1, Task 9
                                .font(.footnote)
                        }
                        //Spread views out evenly horizontally
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.horizontal)
            //MARK: Assignment 1, Task 3
            .navigationBarTitle(Text("Memorize!"), displayMode: .inline)
        }
    }
    
    //MARK: Assignment 1, Extra Credit 2
    //Terrible, hard-coded linear range from about 65-90
    func widthThatBestFits(cardCount: Int) -> CGFloat {
        let cards = cardCount - 8
        let ratio = 25 / 16
        return CGFloat(90 - (ratio) * (cards))
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
    }
}
