//
//  RowView.swift
//  Bullseye
//
//  Created by Dari Kutelov on 9.02.23.
//

import SwiftUI

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
                .padding(.leading, -6.0)
            Spacer()
            ScoreLabelText(score: score)
                .frame(width: Constants.Leaderboard.scoreColWidth)
            Spacer()
            DateLabelText(date: date)
                .frame(width: Constants.Leaderboard.dateColWidth)
        }
        .background {
            RoundedRectangle(
                cornerRadius: .infinity
            )
              .strokeBorder(
                Color("RoundedTextStrokeColor"),
                lineWidth: Constants.General.strokeWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(index: 1, score: 499, date: Date())
        RowView(index: 1, score: 499, date: Date()).preferredColorScheme(.dark)
        RowView(index: 1, score: 499, date: Date())
          .previewLayout(.fixed(width: 568, height: 320))
        RowView(index: 1, score: 499, date: Date())
          .previewLayout(.fixed(width: 568, height: 320))
          .preferredColorScheme(.dark)
    }
}
