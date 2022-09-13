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
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .overlay {
                Circle().stroke(Color("ButtonStrokeColor"),lineWidth: Constants.General.strokeWidth)
            }
        
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .frame(width: Constants.General.roundedRectViewHeight, height: Constants.General.roundedRectViewHeight)
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
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                    .stroke(lineWidth: Constants.General.strokeWidth)
                    .foregroundColor(Color("ButtonStrokeColor"))
            )
    }
}

struct RoundedTextView : View {
    let text: String
    
    var body: some View {
        Text(text)
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .overlay {
                Circle().stroke(Color("LeaderboardRowColor"),lineWidth: Constants.General.strokeWidth)
                
            }
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10){
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            
            RoundedImageViewFilled(systemName: "list.dash")
            RoundRectTextView(text: "100")
            RoundedTextView(text: "1")
            
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
