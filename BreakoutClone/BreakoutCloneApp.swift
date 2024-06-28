//
//  BreakoutCloneApp.swift
//  BreakoutClone
//
//  Created by Maksymilian Nowak on 25/06/2024.
//

import SwiftUI

@main
struct BreakoutCloneApp: App {
    @State private var model = BlockModel(blocks: 6, rows: 7, blockWidth: 60.0, blockHeight: 15.0, blockSpacing: 5.0)
    @State private var platformModel = PlatformModel()
    var body: some Scene {
        WindowGroup {
            ContentView(model: model, platformModel: platformModel)
        }
    }
}
