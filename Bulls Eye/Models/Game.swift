//
//  Game.swift
//  Bulls Eye
//
//  Created by Celil Çağatay Gedik on 9.09.2022.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        100 - abs(self.target - sliderValue)
    }
}


