//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Dariy Kutelov on 30.01.23.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(
        width: Constants.General.roundedViewLength,
        height: Constants.General.roundedRectViewHeight
      )
      .overlay(
        Circle()
          .strokeBorder(
            Color("ButtonStrokeColor"),
            lineWidth: Constants.General.strokeWidth
          )
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(
        width: Constants.General.roundedViewLength,
        height: Constants.General.roundedRectViewHeight
      )
      .background(
        Circle()
          .fill(Color("ButtonFilledBackgroundColor"))
      )
  }
}

struct RoundedNumberViewFilled: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.title3)
      .bold()
      .foregroundColor(Color("TextColor"))
      .kerning(-0.2)
      .frame(
        width: Constants.General.roundedRectViewWidth,
        height: Constants.General.roundedRectViewHeight
      )
      .overlay(
        RoundedRectangle(
          cornerRadius: Constants.General.roundedRectCornerRadius
        )
          .strokeBorder(
            Color("ButtonStrokeColor"),
            lineWidth: Constants.General.strokeWidth
          )
      )
  }
}

struct RoundedTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.title2)
      .bold()
      .foregroundColor(Color("TextColor"))
      .frame(
        width: Constants.General.roundedRectViewWidth,
        height: Constants.General.roundedRectViewHeight
      )
      .overlay(
        Circle()
          .strokeBorder(
            Color("RoundedTextStrokeColor"),
            lineWidth: Constants.General.strokeWidth
          )
      )
  }
}

struct PreviewView: View {
  var body: some View {
    VStack(spacing: 10) {
      RoundedImageViewStroked(systemName: "arrow.counterclockwise")
        .padding(.bottom, 50.0)
      RoundedImageViewFilled(systemName: "list.dash")
        .padding(.bottom, 50.0)
      RoundedNumberViewFilled(text: "999")
        RoundedTextView(text: "1")
    }
  }
}

struct RoundedViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    PreviewView().preferredColorScheme(.dark)
  }
}
