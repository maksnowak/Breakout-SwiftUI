//
//  Ball.swift
//  Nowak_Arkanoid
//
//  Created by apios on 26/06/2024.
//

import SwiftUI

struct Ball: View {
    @ObservedObject var physics = BallPhysics()
    var body: some View {
        Circle().frame(width: 20, height: 20).offset(x: physics.offset_x, y: physics.offset_y)
    }
}

struct Ball_Previews: PreviewProvider {
    static var previews: some View {
        Ball()
    }
}
