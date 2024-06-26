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
    @Published var offset_x = 0.0
    @Published var offset_y = 0.0
    var velocity = 5.0
    var x_direction_positive = true
    var y_direction_positive = false
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    init(model: BlockModel) {
        self.model = model
    }
    
    func update() {
        if (x_direction_positive) {
            offset_x += velocity
        } else {
            offset_x -= velocity
        }
        if (y_direction_positive) {
            offset_y += velocity
        } else {
            offset_y -= velocity
        }
        
        checkCollisions: for row_num in 0..<model.noRows {
            for block_num in 0..<model.noBlocks {
                let block = model.grid[row_num][block_num]
                if (block.broken) {
                    continue
                }
                if (offset_x >= block.bounds.x_min && offset_x <= block.bounds.x_max && -offset_y >= block.bounds.y_min - screenHeight - 230.0 && -offset_y <= block.bounds.y_max - screenHeight - 230.0) {
                    model.handleCollision(row: row_num, block: block_num)
                    break checkCollisions
                }
            }
        }
        
        if (offset_x <= -screenWidth/2 || offset_x >= screenWidth/2) {
            x_direction_positive = !x_direction_positive
        }
        if (-offset_y > screenHeight - 230.0) {
            y_direction_positive = !y_direction_positive
        }
    }
    
}
