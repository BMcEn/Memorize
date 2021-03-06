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
    var vehicleEmojis = ["ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð",
                  "ð", "ð", "ð", "ðš", "ð", "ðĒ", "ð", "ðĩ", "ðĪ", "ð ",
                  "ð", "ð ", "ðķ", "âĩïļ" ]
    var spookyEmojis = ["ðŧ","ð","ð―","ð","ð·","ð§ââïļ","ðĶ",
                        "ðŠĶ","ðļ","ðŪ","ðŊ","ðŽ","ðĪ"]
    var foodEmoji = ["ð","ð­","ðŪ","ðŊ","ðĨ","ðĨŠ","ð","ð",
                     "ð","ðĨ","ðĢ","ðĪ","ð§","ðŠ","ðĐ","ðĶ","ð"]
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
