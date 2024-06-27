//
//  PlatformArea.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct PlatformArea: View {
    @ObservedObject var platformModel: PlatformModel
    init(platformModel: PlatformModel) {
        self.platformModel = platformModel
    }
//    let screenWidth = UIScreen.main.bounds.width
//    @State var offset = CGSize.zero
//    @State var platformWidth = 90.0
//    @State var platofrmHeight = 20.0
    var body: some View {
        Platform(width: platformModel.platformWidth, height: platformModel.platofrmHeight).offset(x: platformModel.offset.width, y: CGFloat.zero).gesture(DragGesture().onChanged { gesture in
            platformModel.offset = gesture.translation
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
