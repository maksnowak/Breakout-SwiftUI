//
//  PlatformModel.swift
//  Nowak_Arkanoid
//
//  Created by Maksymilian Nowak on 27/06/2024.
//

import Foundation
import SwiftUI

class PlatformModel: ObservableObject {
    let screenWidth = UIScreen.main.bounds.width
    @Published var offset = CGSize.zero
    @Published var platformWidth = 90.0
    @Published var platofrmHeight = 20.0
}
