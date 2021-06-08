//
//  EmojiArrays.swift
//  Memorize
//
//  Created by Benjamin McEnulty on 6/7/21.
//

import Foundation

struct Theme: Identifiable, Hashable {
    var title: String
    var image: String
    var emojis: [String]
    var id = UUID()
}

struct GameModel {
    var vehicleEmojis = ["🚕", "🚗", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐",
                  "🚚", "🚛", "🚜", "🛺", "🚃", "🚢", "🚂", "🛵", "🚤", "🎠",
                  "🚁", "🚠", "🛶", "⛵️" ]
    var spookyEmojis = ["👻","💀","👽","🎃","🕷","🧟‍♂️","🦇",
                        "🪦","🛸","🔮","🕯","🍬","🖤"]
    var foodEmoji = ["🍔","🌭","🌮","🌯","🥗","🥪","🍕","🍟",
                     "🍖","🥓","🍣","🍤","🧇","🍪","🍩","🍦","🎂"]
    var themes: [Theme] = []
    var themeDictionary: [String : [String]] = [:]
    
    init() {
        themes = [
        Theme(title: "Vehicles", image: "car", emojis: vehicleEmojis),
        Theme(title: "Halloween", image: "moon", emojis: spookyEmojis),
        Theme(title: "Food", image: "mouth", emojis: foodEmoji)]
        
        themeDictionary = ["Vehicles" : vehicleEmojis,
                               "Halloween" : spookyEmojis,
                               "Food" : foodEmoji]
    }
}
