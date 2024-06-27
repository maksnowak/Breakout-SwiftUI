//
//  BlockModel.swift
//  Nowak_Arkanoid
//
//  Created by apios on 26/06/2024.
//

import Foundation
import SwiftUI

struct BlockBounds {
    let x_min: CGFloat
    let x_max: CGFloat
    let y_min: CGFloat
    let y_max: CGFloat
    init (vertices: [CGFloat]) {
        self.x_min = vertices[0]
        self.x_max = vertices[1]
        self.y_min = vertices[2]
        self.y_max = vertices[3]
    }
}

class BlockInfo: ObservableObject {
    @Published var broken: Bool
    @Published var hitsLeft: Int
    var points: Int
    var bounds: BlockBounds
    init(broken: Bool, hitsLeft: Int, points: Int, bounds: BlockBounds) {
        self.broken = broken
        self.hitsLeft = hitsLeft
        self.points = points
        self.bounds = bounds
    }
}

class BlockModel: ObservableObject {
    let screenWidth = UIScreen.main.bounds.width
    let blockWidth: CGFloat
    let blockHeight: CGFloat
    let blockSpacing: CGFloat
    var noBlocks: Int
    var noRows: Int
    @Published var totalScore = 0;
    @Published var grid: [[BlockInfo]] = []
    init (blocks: Int, rows: Int, blockWidth: CGFloat, blockHeight: CGFloat, blockSpacing: CGFloat) {
        self.noRows = rows
        self.noBlocks = blocks
        self.blockWidth = blockWidth
        self.blockHeight = blockHeight
        self.blockSpacing = blockSpacing
        var totalHeight = CGFloat(self.noRows) * self.blockWidth + self.blockSpacing * CGFloat(self.noRows - 1)
        print(totalHeight)
        for i in 0..<noRows {
            var row: [BlockInfo] = []
            for j in 0..<noBlocks {
                let blockVertices = BlockBounds(vertices: [
                    CGFloat(i) * (self.blockWidth + self.blockSpacing),
                    CGFloat(i) * (self.blockWidth + self.blockSpacing) + self.blockWidth,
                    totalHeight - (CGFloat(j) * (self.blockHeight + self.blockSpacing)),
                    totalHeight - (CGFloat(j) * (self.blockHeight + self.blockSpacing)) + self.blockHeight
                ])
                row.append(BlockInfo(broken: false, hitsLeft: 1, points: 10, bounds: blockVertices))
                print(blockVertices)
            }
            self.grid.append(row)
        }
    }
    
    func handleCollision(row: Int, block: Int) {
        let handledBlock = grid[row][block]
        print("before")
        print(handledBlock.hitsLeft)
        print(handledBlock.broken)
        handledBlock.hitsLeft -= 1
        if handledBlock.hitsLeft == 0 {
            handledBlock.broken = true
            totalScore += handledBlock.points
        }
        print("after")
        print(handledBlock.hitsLeft)
        print(handledBlock.broken)
    }
}
