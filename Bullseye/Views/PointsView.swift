//
//  PointsView.swift
//  Bullseye
//
//  Created by Dariy Kutelov on 1.02.23.
//

import SwiftUI

struct PointsView: View {
  @Binding var game: Game
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
 
  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: Int(sliderValue))
    
    VStack(spacing: 10) {
      InstructionText(text: "The slider's value is")
      BigNumberText(text: String(roundedValue))
      BodyText(text: "You scored \(points) points\n🎉🎉🎉")
      Button {
        withAnimation {
          alertIsVisible = false
          game.startNewRound(points: game.points(sliderValue: Int(sliderValue)))
        }
      } label: {
        BottomText(text: "Start New Round")
      }

    }
      .padding()
      .frame(maxWidth: 300)
      .background(Color("BackgroundColor"))
      .cornerRadius(Constants.General.roundedRectCornerRadius)
      .shadow(radius: 10, x: 5, y: 5)
      .transition(.scale)
  }
}

struct PointsView_Previews: PreviewProvider {
  static var previews: some View {
    PointsView( game: .constant(Game()),
                alertIsVisible: .constant(false),
                sliderValue: .constant(50.0))
    PointsView( game: .constant(Game()),
                alertIsVisible: .constant(false),
                sliderValue: .constant(50.0))
    .preferredColorScheme(.dark)
    PointsView( game: .constant(Game()),
                alertIsVisible: .constant(false),
                sliderValue: .constant(50.0))
    .previewLayout(.fixed(width: 568, height: 320))
    PointsView( game: .constant(Game()),
                alertIsVisible: .constant(false),
                sliderValue: .constant(50.0))
    .previewLayout(.fixed(width: 568, height: 320))
    .preferredColorScheme(.dark)
  }
}
