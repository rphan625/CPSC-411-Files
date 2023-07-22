//
//  OceanZoneView.swift
//  Battleship
//
//  Created by csuftitan on 12/11/22.
//

import SwiftUI

struct OceanZoneView: View {
    @Binding var state: OceanZoneState
    private let circleScale = CGSize(width: 0.5, height: 0.5)
    
    var body: some View {
        ZStack {
            Rectangle()
                .strokeBorder(.black, lineWidth: 2)
                .background(.white)
            
            if (state != .clear) {
                ScaledShape(shape: Circle(), scale: circleScale)
                    .fill(circleColor())
            }
        }
    }
    
    func circleColor() -> Color {
        return (state == .hit) ? .red : .white
    }
}

struct OceanZoneView_Previews: PreviewProvider {
    static var previews: some View {
        OceanZoneView(state: .constant(.miss))
    }
}
