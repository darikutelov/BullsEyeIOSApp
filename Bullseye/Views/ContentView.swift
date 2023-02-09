//
//  ContentView.swift
//  Bullseye
//
//  Created by Dariy Kutelov on 29.01.23.
//

import SwiftUI

struct ContentView: View {
  @State private var game = Game()
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0

  var body: some View {
    ZStack {
      BackgroundView(game: $game)
      VStack {
        InstructionView(game: $game).padding(
          .bottom, alertIsVisible ? 0 : 100
        )
        .transition(.slide)
        if alertIsVisible {
          PointsView(
            game: $game,
            alertIsVisible: $alertIsVisible,
            sliderValue: $sliderValue
          ).transition(.scale)
        } else {
          HitMeButton(
            game: $game,
            alertIsVisible: $alertIsVisible,
            sliderValue: $sliderValue).transition(.scale)
        }
      }
      if !alertIsVisible {
        SliderView(sliderValue: $sliderValue)
          .transition(.scale)
      }
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct InstructionView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯\nPut the bullseye as close as you can to")
        .padding(.leading, 30.0)
        .padding(.trailing, 30.0)
      BigNumberText(text: "\(game.target)")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .preferredColorScheme(.dark)
    ContentView()
      .previewLayout(.fixed(width: 568, height: 320))
    ContentView()
      .previewLayout(.fixed(width: 568, height: 320))
      .preferredColorScheme(.dark)
  }
}
