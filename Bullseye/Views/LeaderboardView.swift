//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Dari Kutelov on 9.02.23.
//

import SwiftUI

struct LeaderboardView: View {
  @Binding public var leaderboardIsShown: Bool
  @Binding public var game: Game
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      VStack(spacing: 10) {
        Spacer()
        HeaderView(leaderboardIsShown: $leaderboardIsShown)
        Spacer()
          .frame(maxHeight: 24)
        LabelView()
        ScrollView {
          VStack(spacing: 10) {
            ForEach(game.leaderboardEntries.indices) { i in
              let leaderboardEntry = game.leaderboardEntries[i]
              RowView(
                index: i + 1,
                score: leaderboardEntry.score,
                date: leaderboardEntry.date
              )
            }
          }
        }
        Spacer()
      }
    }
  }
}

struct HeaderView: View {
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  @Binding public var leaderboardIsShown: Bool
  
  var body: some View {
    ZStack {
      HStack {
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
          BigBoldText(text: "Leaderboard")
            .padding(.leading)
          Spacer()
        } else {
          BigBoldText(text: "Leaderboard")
        }
      }
      HStack {
        Spacer()
        Button {
          leaderboardIsShown = false
        } label: {
          RoundedImageViewFilled(systemName: "xmark")
            .padding(.trailing)
        }
      }
    }
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(text: "Score", isUppercased: true, textSize: .caption, fontWeight: .bold, kerningValue: 1.5)
        .frame(width: Constants.Leaderboard.scoreColWidth)
      Spacer()
      LabelText(text: "Date", isUppercased: true, textSize: .caption, fontWeight: .bold, kerningValue: 1.5)
        .frame(width: Constants.Leaderboard.dateColWidth)
    }
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}

struct LeaderBoardView_Previews: PreviewProvider {
  static var previews: some View {
    LeaderboardView(leaderboardIsShown: .constant(true), game: .constant(Game(loadedTestData: true)))
  }
}
