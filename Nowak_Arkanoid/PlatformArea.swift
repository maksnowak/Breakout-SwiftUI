//
//  PlatformArea.swift
//  Nowak_Arkanoid
//
//  Created by apios on 25/06/2024.
//

import SwiftUI

struct PlatformArea: View {
    @State var offset = CGSize.zero
    var body: some View {
        Platform().offset(x: offset.width, y: CGFloat.zero).gesture(DragGesture().onChanged { gesture in
            offset = gesture.translation
        })
    }
}

struct PlatformArea_Previews: PreviewProvider {
    static var previews: some View {
        PlatformArea()
    }
}
