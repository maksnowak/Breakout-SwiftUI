//
//  CurrentScore.swift
//  Nowak_Arkanoid
//
//  Created by Maksymilian Nowak on 25/06/2024.
//

import SwiftUI

struct CurrentScore: View {
    @Binding var score: Int
    var body: some View {
        Text("\(score)").font(.system(size: 40).bold())
    }
}

struct CurrentScorePreview: View {
    @State private var model = BlockModel(blocks: 6, rows: 7, blockWidth: 60.0, blockHeight: 15.0, blockSpacing: 5.0)
    var body: some View {
        CurrentScore(score: $model.totalScore)
    }
}

struct CurrentScore_Previews: PreviewProvider {
    static var previews: some View {
        CurrentScorePreview()
    }
}
