//
//  ContentView.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = BlockModel(blocks: 6, rows: 7, blockWidth: 60.0, blockHeight: 15.0, blockSpacing: 5.0)
    var body: some View {
        let ball = Ball(model: model)
        let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        ZStack {
            GeometryReader { geometry in
                CurrentScore(model: model).padding().position(x: geometry.size.width/2, y: 30.0)
            }
            GeometryReader { geometry in
                ball.position(x: geometry.size.width/2, y: geometry.size.height - 70.0).onReceive(timer) { _ in
                    ball.physics.update()
                }
            }.zIndex(1)
            GeometryReader { geometry in
                BlockGrid(model: model).position(x: geometry.size.width/2, y: 150.0)
            }
            GeometryReader { geometry in
                PlatformArea().position(x: geometry.size.width/2, y: geometry.size.height - 50.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
