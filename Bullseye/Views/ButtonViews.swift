//
//  ButtonViews.swift
//  Bullseye
//
//  Created by Dariy Kutelov on 30.01.23.
//

import SwiftUI

struct HitMeButton: View {
  @Binding var game: Game
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  
  var body: some View {
    Button(action: {
      withAnimation {
        alertIsVisible = true
      }
    }) {
      Text("Hit Me".uppercased())
        .textCase(.uppercase)
        .bold()
        .font(.title)
    }
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(
          colors: [Color.white.opacity(0.3), Color.clear],
          startPoint: .top,
          endPoint: .bottom
        )
      }
    )
    .foregroundColor(Color.white)
    .cornerRadius(
      Constants.General.roundedRectCornerRadius
    )
    .overlay(
      RoundedRectangle(
        cornerRadius: Constants.General.roundedRectCornerRadius
      )
        .strokeBorder(
          Color(.white),
          lineWidth: Constants.General.strokeWidth
        )
    )
    .alert(
      "Hello, there!",
      isPresented: $alertIsVisible) {
        Button("Awesome") {
          alertIsVisible = false
          game.startNewRound(
            points: game.points(sliderValue: Int(sliderValue))
          )
        }
      } message: {
        let roundedValue: Int = Int(sliderValue.rounded())
        Text("The slider value is \(Int(roundedValue)).\n" + "You scored \(game.points(sliderValue: roundedValue))")
          .foregroundColor(Color("TextColor"))
      }
      
  }
}

struct ButtonViews_Previews: PreviewProvider {
  static var previews: some View {
    HitMeButton(
      game: .constant(Game()),
      alertIsVisible: .constant(false),
      sliderValue: .constant(50.0)
    )
  }
}
