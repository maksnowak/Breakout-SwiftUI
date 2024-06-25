//
//  Platform.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct Platform: View {
    let platformWidth = 90.0
    let platformHeight = 20.0
    var body: some View {
        Rectangle().frame(width: platformWidth, height: platformHeight)
    }
}

struct Platform_Previews: PreviewProvider {
    static var previews: some View {
        Platform()
    }
}
