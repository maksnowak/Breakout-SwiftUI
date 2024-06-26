//
//  BlockModel.swift
//  Nowak_Arkanoid
//
//  Created by apios on 26/06/2024.
//

import Foundation

struct BlockInfo {
    var broken: Bool
    var hitsLeft: Int
    var points: Int
    init(broken: Bool, hitsLeft: Int, points: Int) {
        self.broken = broken
        self.hitsLeft = hitsLeft
        self.points = points
    }
}

class BlockModel: ObservableObject {
    var noBlocks: Int
    var noRows: Int
    @Published var totalScore = 0;
    @Published var grid: [[BlockInfo]] = []
    init (blocks: Int, rows: Int) {
        self.noRows = rows
        self.noBlocks = rows
        for _ in 0..<noRows {
            var row: [BlockInfo] = []
            for _ in 0..<noBlocks {
                row.append(BlockInfo(broken: false, hitsLeft: 1, points: 10))
            }
            self.grid.append(row)
        }
    }
    
    func handleCollision(row: Int, block: Int) {
        var handledBlock = grid[row][block]
        handledBlock.hitsLeft -= 1
        if handledBlock.hitsLeft == 0 {
            handledBlock.broken = true
            totalScore += handledBlock.points
        }
    }
}
