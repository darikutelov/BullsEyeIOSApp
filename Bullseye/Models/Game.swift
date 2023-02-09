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
  var leaderboardEntries: [LeaderboardEntry] = []
  
  init(loadedTestData: Bool = false) {
    if loadedTestData {
      leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 20, date: Date()))
    }
  }
  
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
    addToLeaderboard(points:points)
    target = Int.random(in: 1...100)
  }
  
  mutating func restart() {
    score = 0
    round = 1
    leaderboardEntries = []
    target = Int.random(in: 1...100)
  }
  
  mutating func addToLeaderboard(points: Int) {
    let leaderboardEntry = LeaderboardEntry(score: points, date: Date())
    leaderboardEntries
      .append(leaderboardEntry)
    leaderboardEntries.sort {
      $0.score > $1.score
    }
  }
}
