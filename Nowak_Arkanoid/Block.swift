//
//  Block.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct Block: View {
    var color: Color
    @Binding var hidden: Bool
    var body: some View {
        Rectangle().fill(color).frame(width: 60, height: 15).opacity(hidden ? 0.0 : 100.0)
    }
}


struct BindingBlockPreview : View {
    @State private var hidden = false
    
    var body: some View {
        Block(color: .red, hidden: $hidden)
    }
}

struct Block_Previews: PreviewProvider {
    static var previews: some View {
        BindingBlockPreview()
    }
}
