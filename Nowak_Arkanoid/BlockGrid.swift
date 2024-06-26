//
//  BlockGrid.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct BlockGrid: View {
    @ObservedObject var model: BlockModel
    var colors = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.indigo, Color.purple]
    
    init(model: BlockModel) {
        self.model = model
    }
    
    var body: some View {
        VStack(spacing: 5) {
            ForEach(0..<model.noRows) { row in
                HStack(spacing: 5) {
                    ForEach(0..<model.noBlocks) { block in
                        Block(color: colors[row], hidden: !model.grid[row][block].broken)
                    }
                }
            }
        }
    }
}

struct BlockGrid_Previews: PreviewProvider {
    static var previews: some View {
        BlockGrid(model: BlockModel(blocks: 6, rows: 7, blockWidth: 60.0, blockHeight: 15.0, blockSpacing: 5.0))
    }
}
