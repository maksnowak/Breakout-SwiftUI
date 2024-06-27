//
//  Nowak_ArkanoidApp.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

@main
struct Nowak_ArkanoidApp: App {
    @State private var model = BlockModel(blocks: 6, rows: 7, blockWidth: 60.0, blockHeight: 15.0, blockSpacing: 5.0)
    var body: some Scene {
        WindowGroup {
            ContentView(model: model, ball: Ball(model: model), score: CurrentScore(score: $model.totalScore), grid: BlockGrid(model: model), platform: PlatformArea())
        }
    }
}
