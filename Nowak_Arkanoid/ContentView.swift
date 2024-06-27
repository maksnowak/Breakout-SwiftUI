//
//  ContentView.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: BlockModel
    @State var ball: Ball
    @State var score: CurrentScore
    @State var grid: BlockGrid
    @State var platform: PlatformArea
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                score.padding().position(x: geometry.size.width/2, y: 30.0)
            }
            GeometryReader { geometry in
                ball.position(x: geometry.size.width/2, y: geometry.size.height - 70.0).onReceive(timer) { _ in
                    ball.physics.update()
                }
            }.zIndex(1)
            GeometryReader { geometry in
                grid.position(x: geometry.size.width/2, y: 150.0)
            }
            GeometryReader { geometry in
                platform.position(x: geometry.size.width/2, y: geometry.size.height - 50.0)
            }
        }
    }
}

struct ContentViewPreviewContainer: View {
    @State private var model = BlockModel(blocks: 6, rows: 7, blockWidth: 60.0, blockHeight: 15.0, blockSpacing: 5.0)
    
    var body: some View {
        ContentView(model: model, ball: Ball(model: model), score: CurrentScore(score: $model.totalScore), grid: BlockGrid(model: model), platform: PlatformArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewPreviewContainer()
    }
}
