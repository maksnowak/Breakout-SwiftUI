//
//  BallPhysics.swift
//  Nowak_Arkanoid
//
//  Created by apios on 26/06/2024.
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
        
        print("Ball position: \(offset_x), \(offset_y)")
        
        checkCollisions: for row_num in 0..<model.noRows {
            for block_num in 0..<model.noBlocks {
                let block = model.grid[row_num][block_num]
                if (block.broken) {
                    continue
                }
                let x_in = offset_x + screenWidth/2 >= block.bounds.x_min && offset_x + screenWidth/2 <= block.bounds.x_max
                let y_in = -offset_y - 115.0 >= block.bounds.y_min && -offset_y - 115.0 <= block.bounds.y_max
                if (x_in && y_in) {
                    print("Collision detected with block at row \(row_num), column \(block_num)")
                    print("Block vertices: x - (\(block.bounds.x_min), \(block.bounds.x_max)); y - (\(block.bounds.y_min), \(block.bounds.y_max))")
                    model.handleCollision(row: row_num, block: block_num)
                    x_direction_positive = !x_direction_positive
                    y_direction_positive = !y_direction_positive
                    velocity_x = Double.random(in: (velocity_x)...(velocity_x+0.5))
                    velocity_y = Double.random(in: (velocity_y)...(velocity_y+0.5))
                    break checkCollisions
                }
            }
        }
        
        let x_in = offset_x >= platformModel.offset.width - platformModel.platformWidth/2 && offset_x <= platformModel.offset.width + platformModel.platformWidth/2
        if (x_in && offset_y >= CGFloat.zero && offset_y <= CGFloat.zero + platformModel.platofrmHeight) {
            x_direction_positive = Bool.random()
            y_direction_positive = !y_direction_positive
            velocity_x = Double.random(in: (velocity_x-0.2)...(velocity_x+0.2))
            velocity_y = Double.random(in: (velocity_y-0.2)...(velocity_y+0.2))
        }
        
        if (offset_x <= -screenWidth/2 || offset_x >= screenWidth/2) {
            x_direction_positive = !x_direction_positive
        }
        if (-offset_y > screenHeight - 230.0) {
            y_direction_positive = !y_direction_positive
        }
    }
    
}
