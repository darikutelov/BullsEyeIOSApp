//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Dariy Kutelov on 31.01.23.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack(spacing: 5) {
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding(.horizontal, 36)
    .padding(.vertical, 48)
    .background(
      RingsView()
    )
  }
}

struct TopView: View {
  @Binding var game: Game
  @State private var leaderboardIsShown = false
  
  var body: some View {
    HStack {
      Button {
        game.restart()
      } label: {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      }
      Spacer()
      Button(action: {
        leaderboardIsShown = true
      }) {
        RoundedImageViewStroked(systemName: "list.dash")
      }.sheet(isPresented: $leaderboardIsShown, content: {
        LeaderboardView(leaderboardIsShown: $leaderboardIsShown, game: $game)
      })
    }
  }
}

struct NumberView: View {
  var text: String
  var title: String
  
  var body: some View {
    VStack {
      NumberLabelText(text: title)
        .padding(.bottom, -2)
      RoundedNumberViewFilled(text: text)
    }
  }
}

struct BottomView: View {
  @Binding var game: Game
  
  var body: some View {
    HStack {
      NumberView(text: "\(game.score)", title: "Score")
      Spacer()
      NumberView(text:  "\(game.round)", title: "Round")
    }
  }
}

struct RingsView: View {
  @Environment(\.colorScheme) var themeMode
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      ForEach(1..<6) { ring in
        let size = CGFloat(ring * 100)
        let opacity = themeMode == .dark ? 0.1 : 0.3
        Circle()
          .stroke(lineWidth: 20)
          .fill(
            RadialGradient(
              gradient: Gradient(
                colors:
                  [Color("RingsColor").opacity(0.8 * opacity),
                   Color("RingsColor").opacity(0)
                  ]
              ),
              center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
              startRadius: 100,
              endRadius: 300)
          )
          .frame(width: size, height: size)
      }
    }
  }
}


struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
  }
}
