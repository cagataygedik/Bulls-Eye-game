//
//  RoundedViews.swift
//  Bulls Eye
//
//  Created by Celil Çağatay Gedik on 11.09.2022.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .frame(width: 56.0, height: 56.0)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .overlay {
                Circle().stroke(Color("ButtonStrokeColor"),lineWidth: 2.0)
            }
        
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .frame(width: 56.0, height: 56.0)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .background(Circle()
                .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundRectTextView: View {
    var text: String
    
    var body: some View {
       Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: 68.0, height: 56.0)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .stroke(lineWidth: 2.0)
                    .foregroundColor(Color("ButtonStrokeColor"))
            )
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10){
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextView(text: "100")
            
        }
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
