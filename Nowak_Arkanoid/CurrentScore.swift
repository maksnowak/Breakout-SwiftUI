//
//  CurrentScore.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct CurrentScore: View {
    @State var score = 0
    var body: some View {
        Text("\(score)").font(.system(size: 40).bold())
    }
}

struct CurrentScore_Previews: PreviewProvider {
    static var previews: some View {
        CurrentScore()
    }
}
