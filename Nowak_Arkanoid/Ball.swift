//
//  Ball.swift
//  Nowak_Arkanoid
//
//  Created by apios on 26/06/2024.
//

import SwiftUI

struct Ball: View {
    @State var offset_x = 0.0
    @State var offset_y = 0.0
    var body: some View {
        Circle().frame(width: 20, height: 20).offset(x: offset_x, y:offset_y)
    }
}

struct Ball_Previews: PreviewProvider {
    static var previews: some View {
        Ball()
    }
}
