//
//  ContentView.swift
//  Animations
//
//  Created by mac on 1/17/23.
//
//@State private var animateAmount = 1.0
//Button("Tap me") {
////            animateAmount += 1
//}
//.padding(50)
//.background(.red)
//.foregroundColor(.white)
//.clipShape(Circle())
//.overlay(
//    Circle()
//        .stroke(.red)
//        .scaleEffect(animateAmount)
//        .opacity(2 - animateAmount)
//        .animation(.easeInOut(duration: 1)
//            .delay(1)
//            .repeatForever(autoreverses: false),
//                   value: animateAmount)
//    )
//.onAppear {
//    animateAmount = 2
//}
//@State private var animationAmount = 0.0
//Button("tap me") {
//    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//        animationAmount += 360
//    }
//}
//.padding(50)
//.background(.red)
//.foregroundColor(.white)
//.clipShape(Circle())
//.rotation3DEffect(.degrees(animationAmount), axis: (x: 3, y: 3, z: 4  ))
import SwiftUI

struct ContentView: View {
    let letters = Array("Hello World")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num) / 20),
                               value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
