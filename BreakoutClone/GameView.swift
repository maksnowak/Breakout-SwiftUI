//
//  GameView.swift
//  BreakoutClone
//
//  Created by Maksymilian Nowak on 25/06/2024.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var model: BlockModel
    @ObservedObject var platformModel: PlatformModel
    @State var ball: Ball
    @State var grid: BlockGrid
    @State var platform: PlatformArea
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                CurrentScore(score: $model.totalScore).padding().position(x: geometry.size.width/2, y: 30.0)
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

struct GameViewPreviewContainer: View {
    @State private var model = BlockModel(blocks: 6, rows: 7, blockWidth: 60.0, blockHeight: 15.0, blockSpacing: 5.0)
    @State private var platformModel = PlatformModel()
    
    var body: some View {
        GameView(model: model, platformModel: platformModel, ball: Ball(model: model, platformModel: platformModel), grid: BlockGrid(model: model), platform: PlatformArea(platformModel: platformModel))
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameViewPreviewContainer()
    }
}
