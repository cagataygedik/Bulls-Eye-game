//
//  shapes.swift
//  Bulls Eye
//
//  Created by Celil Çağatay Gedik on 11.09.2022.
//

import SwiftUI

struct shapes: View {
    @State private var wideShapes = true
    
    var body: some View {
        VStack {
            if !wideShapes {
                
                Circle()
                //  .fill(Color.blue)
                
                    .strokeBorder(Color.blue, lineWidth: 20.0)
                    .frame(width: 200, height: 100.0)
                    .transition(.slide)
            }
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100,  height: 100.0)
            
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100.0)
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: 100.0)
            Button("Animate") {
                withAnimation{
                    wideShapes.toggle()
                }
            }
        }
        .background(Color.green)
    }
}

struct shapes_Previews: PreviewProvider {
    static var previews: some View {
        shapes()
    }
}
