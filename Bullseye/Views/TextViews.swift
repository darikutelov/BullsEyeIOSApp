//
//  TextViews.swift
//  Bullseye
//
//  Created by Dariy Kutelov on 30.01.23.
//

import SwiftUI

struct InstructionText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .foregroundColor(Color("TextColor"))
      .multilineTextAlignment(.center)
      .bold()
      .font(.footnote)
      .lineSpacing(4.0)
      .kerning(2.0)
  }
}

struct BigNumberText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColor"))
      .font(.largeTitle)
      .fontWeight(.black)
      .kerning(-1.0)
  }
}

struct SliderLabelText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.body)
      .bold()
      .foregroundColor(Color("TextColor"))
      .frame(width: 35.0)
  }
}

struct NumberLabelText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .font(.caption)
      .bold()
      .foregroundColor(Color("TextColor"))
      .kerning(1.5)
  }
}

struct BodyText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .foregroundColor(Color("TextColor"))
      .multilineTextAlignment(.center)
      .lineSpacing(12.0)
  }
}

struct BottomText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.body)
      .foregroundColor(.white)
      .bold()
      .padding()
      .frame(maxWidth:.infinity)
      .background(Color.accentColor)
      .cornerRadius(12)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "Instructions")
      BigNumberText(text: "42")
      SliderLabelText(text: "1")
      NumberLabelText(text: "Score")
      BodyText(text: "You scored 200 points\n🎉🎉🎉")
      BottomText(text: "Start New Round")
    }
    .padding()
  }
}
