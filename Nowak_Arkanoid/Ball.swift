//
//  Ball.swift
//  Nowak_Arkanoid
//
//  Created by Maksymilian Nowak on 26/06/2024.
//

import SwiftUI

struct Ball: View {
    @ObservedObject var model: BlockModel
    @ObservedObject var physics: BallPhysics
    @ObservedObject var platformModel: PlatformModel
    
    init(model: BlockModel, platformModel: PlatformModel) {
        self.model = model
        self.platformModel = platformModel
        self.physics = BallPhysics(model: model, platformModel: platformModel)
    }
    
    var body: some View {
        Circle().frame(width: 20, height: 20).offset(x: physics.offset_x, y: physics.offset_y)
    }
}

struct Ball_Previews: PreviewProvider {
    static var previews: some View {
        Ball(model: BlockModel(blocks: 6, rows: 7, blockWidth: 60.0, blockHeight: 15.0, blockSpacing: 5.0), platformModel: PlatformModel())
    }
}
