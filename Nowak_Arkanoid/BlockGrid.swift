//
//  BlockGrid.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct BlockGrid: View {
    @ObservedObject var model: BlockModel
    let noRows = 7
    let noBlocks = 6
    var colors = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.indigo, Color.purple]
    
    init(model: BlockModel) {
        self.model = model
    }
    
    var body: some View {
        VStack {
            ForEach(0..<noRows) { row in
                HStack {
                    ForEach(0..<noBlocks) { block in
                        Block(color: colors[row])
                    }
                }
            }
        }
    }
}

struct BlockGrid_Previews: PreviewProvider {
    static var previews: some View {
        BlockGrid(model: BlockModel(blocks: 6, rows: 7))
    }
}
