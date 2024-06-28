//
//  BlockModel.swift
//  BreakoutClone
//
//  Created by Maksymilian Nowak on 26/06/2024.
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
    @Published var points: Int
    @Published var bounds: BlockBounds
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
    @Published var noBlocks: Int
    @Published var noRows: Int
    @Published var totalScore = 0;
    @Published var grid: [[BlockInfo]] = []
    @Published var gameState: GameState = .playing
    @Published var remainingBlocks: Int
    init (blocks: Int, rows: Int, blockWidth: CGFloat, blockHeight: CGFloat, blockSpacing: CGFloat) {
        self.noRows = rows
        self.noBlocks = blocks
        self.blockWidth = blockWidth
        self.blockHeight = blockHeight
        self.blockSpacing = blockSpacing
        self.remainingBlocks = blocks*rows
        let totalHeight = CGFloat(self.noRows) * self.blockWidth + self.blockSpacing * CGFloat(self.noRows - 1) // total height of the block grid
        for i in 0..<noRows {
            var row: [BlockInfo] = []
            for j in 0..<noBlocks {
                // set block vertices for collision checks
                let blockVertices = BlockBounds(vertices: [
                    CGFloat(j) * (self.blockWidth + self.blockSpacing), // x_min
                    CGFloat(j) * (self.blockWidth + self.blockSpacing) + self.blockWidth, // x_max
                    totalHeight - (CGFloat(i) * (self.blockHeight + self.blockSpacing)), // y_min
                    totalHeight - (CGFloat(i) * (self.blockHeight + self.blockSpacing)) + self.blockHeight // y_max
                ])
                row.append(BlockInfo(broken: false, hitsLeft: noRows-i, points: 10*(noRows-i), bounds: blockVertices)) // add to the row array
            }
            self.grid.append(row) // append row to the grid
        }
    }
    
    func handleCollision(row: Int, block: Int) {
        let handledBlock = grid[row][block]
        // decrease hits necessary to break the block
        handledBlock.hitsLeft -= 1
        if handledBlock.hitsLeft == 0 {
            handledBlock.broken = true
            totalScore += handledBlock.points
            remainingBlocks -= 1
        }
        else {
            // if block has not been broken yet, add part of the block's value to the total score
            totalScore += handledBlock.points / handledBlock.hitsLeft
        }
        if remainingBlocks == 0 {
            // if no blocks left, end the game
            gameState = .gameOver
        }
    }
    
    func reset() {
        // reset the model for the next game
        gameState = .playing
        totalScore = 0
        remainingBlocks = noBlocks * noRows
        for i in 0..<noRows {
            for j in 0..<noBlocks {
                grid[i][j].broken = false
                grid[i][j].hitsLeft = noRows - i
            }
        }
    }
}
