//
//  EndGame.swift
//  Nowak_Arkanoid
//
//  Created by apios on 27/06/2024.
//

import SwiftUI

struct EndGame: View {
    @ObservedObject var model: BlockModel
    
    var body: some View {
        VStack {
            Text("Game Over").font(.largeTitle).bold().padding()
            Text("Your score: \(model.totalScore)").padding()
            Button(action: {model.reset()}) {
                Text("Restart").font(.title).bold().padding().background(Color.green).foregroundColor(.white).cornerRadius(10)
            }
        }
    }
}

struct EndGame_Previews: PreviewProvider {
    static var previews: some View {
        EndGame(model: BlockModel(blocks: 6, rows: 7, blockWidth: 60.0, blockHeight: 15.0, blockSpacing: 5.0))
    }
}
