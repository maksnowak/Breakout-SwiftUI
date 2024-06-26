//
//  Block.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct Block: View {
    var color: Color
    @State var hidden: Bool
    init(color: Color, hidden: Bool) {
        self.color = color
        self.hidden = false
    }
    var body: some View {
        Rectangle().fill(color).frame(width: 60, height: 15).opacity(hidden ? 0.0 : 100.0)
    }
}

struct Block_Previews: PreviewProvider {
    static var previews: some View {
        Block(color: .red, hidden: false)
    }
}
