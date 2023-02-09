//
//  ShapesView.swift
//  Bullseye
//
//  Created by Dariy Kutelov on 30.01.23.
//

import SwiftUI

struct ShapesView: View {
  @State private var wideShapes = false
  var body: some View {
    VStack {
      if !wideShapes {
        Circle() // takes as much as it can
          .inset(by: 10.0) // shrinks the circle to the frame
          .stroke(Color.red, lineWidth: 20) //stroke and fill can't work together, goes outside the frame because circle is in the middle of the stroke
//          .fill(Color.green)
          .frame(width: 100.0, height: 100.0) // different view with different shape then circle
          .transition(.scale)
      }
      Circle()
        .strokeBorder(Color.blue, lineWidth: 10)
        .frame(width: wideShapes ? 200 : 100.0, height: wideShapes ? 200 : 100.0)
      Capsule()
        .frame(width: wideShapes ? 200 : 100.0, height: 100)
      Ellipse()
        .frame(width: wideShapes ? 200 : 100.0, height: 100)
      RoundedRectangle(cornerRadius: 20.0)
        .stroke(Color.blue, lineWidth: 2)
        .frame(width: wideShapes ? 200 : 100.0, height: 100)
//        .animation(.easeOut)
      Button("Wide Shapes") {
        withAnimation {
          wideShapes.toggle()
        }
      }
    }
    .background(Color.gray)
  }
}

struct ShapesView_Previews: PreviewProvider {
  static var previews: some View {
    ShapesView()
  }
}
