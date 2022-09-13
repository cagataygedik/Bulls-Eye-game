//
//  BackgroundView.swift
//  Bulls Eye
//
//  Created by Celil Çağatay Gedik on 11.09.2022.
//aa

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
            
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    @State private var leaderboardIsShowing = false
    
    var body: some View {
        HStack{
            Button(action: {
                game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button(action: {
                leaderboardIsShowing = true
            }) {
                RoundedImageViewFilled(systemName: "list.dash")
            }.sheet(isPresented: $leaderboardIsShowing, onDismiss: {
                
            }, content:{
                LeaderboardView(game: $game, leaderboardIsShowing: $leaderboardIsShowing)
                
            })
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5){
            LabelText(text: title.uppercased())
            RoundRectTextView(text: text)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack{
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct RingsView: View {
    
    @Environment (\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            let opacity = colorScheme == .dark ? 0.1 : 0.3
            
            ForEach(1..<6) { ring in
                Circle()
                    .stroke(lineWidth: 20)
                    .fill(
                        
                        RadialGradient(gradient: Gradient(colors: [Color("CircleColor").opacity(0.8*opacity), Color("CircleColor").opacity(0)]),center: .center, startRadius: 100, endRadius: 300))
                
                    .frame(width: CGFloat(ring)*100, height: CGFloat(ring)*100)
            }
            
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}

