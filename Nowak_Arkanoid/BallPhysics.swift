//
//  BallPhysics.swift
//  Nowak_Arkanoid
//
//  Created by Maksymilian Nowak on 26/06/2024.
//

import Foundation
import SwiftUI

class BallPhysics: ObservableObject {
    @ObservedObject var model: BlockModel
    @ObservedObject var platformModel: PlatformModel
    @Published var offset_x = 0.0
    @Published var offset_y = 0.0
    var velocity_x = 7.0
    var velocity_y = 7.0
    var x_direction_positive = true
    var y_direction_positive = false
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    init(model: BlockModel, platformModel: PlatformModel) {
        self.model = model
        self.platformModel = platformModel
    }
    
    func update() {
        if (x_direction_positive) {
            offset_x += velocity_x
        } else {
            offset_x -= velocity_x
        }
        if (y_direction_positive) {
            offset_y += velocity_y
        } else {
            offset_y -= velocity_y
        }
        
        checkCollisions: for row_num in 0..<model.noRows {
            for block_num in 0..<model.noBlocks {
                let block = model.grid[row_num][block_num]
                if (block.broken) {
                    continue
                }
                // check if ball coordinates are inside the block
                let x_in = offset_x + screenWidth/2 + 10 >= block.bounds.x_min && offset_x + screenWidth/2 - 10 <= block.bounds.x_max
                let y_in = -offset_y - 115.0 >= block.bounds.y_min && -offset_y - 115.0 <= block.bounds.y_max
                if (x_in && y_in) {
                    model.handleCollision(row: row_num, block: block_num)
                    // bounce back
                    x_direction_positive = !x_direction_positive
                    y_direction_positive = !y_direction_positive
                    // randomly increase ball speed
                    velocity_x = Double.random(in: (velocity_x)...(velocity_x+1.5))
                    velocity_y = Double.random(in: (velocity_y)...(velocity_y+1.5))
                    break checkCollisions
                }
            }
        }
        
        // check if the ball hit the platform
        let x_in_platform = offset_x >= platformModel.offset.width - platformModel.platformWidth/2 && offset_x <= platformModel.offset.width + platformModel.platformWidth/2
        if (x_in_platform && offset_y >= CGFloat.zero && offset_y <= CGFloat.zero + platformModel.platofrmHeight) {
            // random bounce direction
            x_direction_positive = Bool.random()
            y_direction_positive = !y_direction_positive
            // randomly change ball velocity
            velocity_x = Double.random(in: (velocity_x-0.5)...(velocity_x+0.5))
            velocity_y = Double.random(in: (velocity_y-0.5)...(velocity_y+0.5))
        }
        
        // bounce from screen edges
        if (offset_x <= -screenWidth/2 || offset_x >= screenWidth/2) {
            x_direction_positive = !x_direction_positive
        }
        // bounce from top
        if (-offset_y > screenHeight - 230.0) {
            y_direction_positive = !y_direction_positive
        }
        // if the platform has been missed, end the game
        if offset_y > CGFloat.zero + platformModel.platofrmHeight {
            model.gameState = .gameOver
        }
    }
    
}
