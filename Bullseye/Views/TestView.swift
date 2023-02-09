//
//  TestView.swift
//  Bullseye
//
//  Created by Dariy Kutelov on 7.02.23.
//

import SwiftUI

struct TestView: View {
  let gradientWithFourColors = Gradient(colors: [
      Color.blue,
      Color.pink,
      Color.yellow,
      Color.green
      ]
  )
  var body: some View {
      VStack {
        Circle()
//          .inset(by: 15.0)
//          .stroke(lineWidth: 10.0)
          .fill(
            RadialGradient(
              gradient: gradientWithFourColors,
              center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
              startRadius: 0,
              endRadius: 300)
          )
          .frame(width: 300, height: 300)
          .padding(.bottom, -8.0)
        Circle()
//          .stroke(lineWidth: 10.0)
          .fill(
            RadialGradient(
              gradient: Gradient(
                colors:
                  [Color(.red),
                   Color(.green)
                  ]
              ),
              center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
              startRadius: 100,
              endRadius: 5000)
          )
          .frame(width: 300, height: 300)
      }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
