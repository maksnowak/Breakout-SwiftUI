//
//  BallPhysics.swift
//  Nowak_Arkanoid
//
//  Created by apios on 26/06/2024.
//

import Foundation
import SwiftUI

class BallPhysics: ObservableObject {
    @Published var offset_x = 0.0
    @Published var offset_y = 0.0
    var velocity = 5.0
    var x_direction_positive = true
    var y_direction_positive = false
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
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
        
        if (offset_x <= -screenWidth/2 || offset_x >= screenWidth/2) {
            x_direction_positive = !x_direction_positive
        }
        if (-offset_y > screenHeight - 230.0) {
            y_direction_positive = !y_direction_positive
        }
    }
    
}
