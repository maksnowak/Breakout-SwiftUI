//
//  Platform.swift
//  Nowak_Arkanoid
//
//  Created by Maksymilian Nowak on 25/06/2024.
//

import SwiftUI

struct Platform: View {
    let platformWidth: CGFloat
    let platformHeight: CGFloat
    init (width: CGFloat, height: CGFloat) {
        self.platformWidth = width
        self.platformHeight = height
    }
    var body: some View {
        Rectangle().frame(width: platformWidth, height: platformHeight)
    }
}

struct Platform_Previews: PreviewProvider {
    static var previews: some View {
        Platform(width: 90.0, height: 20.0)
    }
}
