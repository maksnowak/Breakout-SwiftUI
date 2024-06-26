//
//  CurrentScore.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct CurrentScore: View {
    @ObservedObject var model: BlockModel
    @State var score = 0
    
    init(model: BlockModel) {
        self.model = model
    }
    
    var body: some View {
        Text("\(score)").font(.system(size: 40).bold())
    }
}

struct CurrentScore_Previews: PreviewProvider {
    static var previews: some View {
        CurrentScore(model: BlockModel(blocks: 6, rows: 7))
    }
}
