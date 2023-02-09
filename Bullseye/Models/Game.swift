//
//  Game.swift
//  Bullseye
//
//  Created by Dariy Kutelov on 30.01.23.
//

import Foundation

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  
  func points(sliderValue: Int) -> Int {
    let difference = abs(self.target - sliderValue)
    var bonus = 0
    
    if difference == 0 {
      bonus = 100
    } else if difference <= 2 {
      bonus = 50
    }
    
    return 100 - difference + bonus
    //100 - abs(self.target - sliderValue) //one line does not need return
  }
  
  mutating func startNewRound(points: Int) {
    round += 1
    score += points
    target = Int.random(in: 1...100)
  }
  
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 1...100)
  }
}
