//
//  BlockGrid.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct BlockGrid: View {
    let noRows = 7
    var colors = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.indigo, Color.purple]
    var body: some View {
        VStack {
            ForEach(0..<noRows) { row in
                BlockRow(color: colors[row])
            }
        }
    }
}

struct BlockGrid_Previews: PreviewProvider {
    static var previews: some View {
        BlockGrid()
    }
}
