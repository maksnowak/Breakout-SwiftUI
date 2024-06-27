//
//  ContentView.swift
//  Nowak_Arkanoid
//
//  Created by Maksymilian Nowak on 27/06/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: BlockModel
    @ObservedObject var platformModel: PlatformModel
    var body: some View {
        ZStack {
            if model.gameState == .playing {
                GameView(model: model, platformModel: platformModel, ball: Ball(model: model, platformModel: platformModel), grid: BlockGrid(model: model), platform: PlatformArea(platformModel: platformModel))
            } else if model.gameState == .gameOver {
                EndGame(model: model)
            }
        }
    }
}

struct ContentViewPreviewContainer: View {
    @State private var model = BlockModel(blocks: 6, rows: 7, blockWidth: 60.0, blockHeight: 15.0, blockSpacing: 5.0)
    @State private var platformModel = PlatformModel()
    
    var body: some View {
        ContentView(model: model, platformModel: platformModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewPreviewContainer()
    }
}
