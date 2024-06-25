//
//  Block.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct Block: View {
    var color: Color
    init(color: Color) {
        self.color = color
    }
    var body: some View {
        Rectangle().fill(color).frame(width: 60, height: 15)
    }
}

struct Block_Previews: PreviewProvider {
    static var previews: some View {
        Block(color: .red)
    }
}
