//
//  ContentView.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                CurrentScore().padding().position(x: geometry.size.width/2, y: 30.0)
            }
            GeometryReader { geometry in
                BlockGrid().padding().position(x: geometry.size.width/2, y: 150.0)
            }
            GeometryReader { geometry in
                PlatformArea().padding().position(x: geometry.size.width/2, y: geometry.size.height - 50.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
