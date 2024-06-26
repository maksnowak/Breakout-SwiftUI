//
//  PlatformArea.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct PlatformArea: View {
    let screenWidth = UIScreen.main.bounds.width
    @State var offset = CGSize.zero
    @State var platformWidth = 90.0
    @State var platofrmHeight = 20.0
    var body: some View {
        Platform(width: platformWidth, height: platofrmHeight).offset(x: offset.width, y: CGFloat.zero).gesture(DragGesture().onChanged { gesture in
            offset = gesture.translation
            if (offset.width > screenWidth/2 - platformWidth/2) {
                offset.width = screenWidth/2 - platformWidth/2
            }
            else if (offset.width < -screenWidth/2 + platformWidth/2) {
                offset.width = -screenWidth/2 + platformWidth/2
            }
        })
    }
}

struct PlatformArea_Previews: PreviewProvider {
    static var previews: some View {
        PlatformArea()
    }
}
