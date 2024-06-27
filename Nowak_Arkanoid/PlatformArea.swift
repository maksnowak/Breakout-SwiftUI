//
//  PlatformArea.swift
//  Nowak_Arkanoid
//
//  Created by Maksymilian Nowak on 25/06/2024.
//

import SwiftUI

struct PlatformArea: View {
    @ObservedObject var platformModel: PlatformModel
    init(platformModel: PlatformModel) {
        self.platformModel = platformModel
    }
    var body: some View {
        // platform is moved by dragging a finger across the screen
        Platform(width: platformModel.platformWidth, height: platformModel.platofrmHeight).offset(x: platformModel.offset.width, y: CGFloat.zero).gesture(DragGesture().onChanged { gesture in
            platformModel.offset = gesture.translation
            // set the platform bounds to screen edges
            if (platformModel.offset.width > platformModel.screenWidth/2 - platformModel.platformWidth/2) {
                platformModel.offset.width = platformModel.screenWidth/2 - platformModel.platformWidth/2
            }
            else if (platformModel.offset.width < -platformModel.screenWidth/2 + platformModel.platformWidth/2) {
                platformModel.offset.width = -platformModel.screenWidth/2 + platformModel.platformWidth/2
            }
        })
    }
}

struct PlatformArea_Previews: PreviewProvider {
    static var previews: some View {
        PlatformArea(platformModel: PlatformModel())
    }
}
