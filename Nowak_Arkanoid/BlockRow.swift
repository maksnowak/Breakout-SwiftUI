//
//  BlockRow.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct BlockRow: View {
    let noBlocks = 6
    var color: Color
    init (color: Color) {
        self.color = color
    }
    var body: some View {
        HStack {
            ForEach(0..<noBlocks) { block in
                Block(color: color)
            }
        }
    }
}

struct BlockRow_Previews: PreviewProvider {
    static var previews: some View {
        BlockRow(color: .red)
    }
}
