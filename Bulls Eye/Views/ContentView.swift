//
//  ContentView.swift
//  Bulls Eye
//
//  Created by Celil Çağatay Gedik on 9.09.2022.
//aa

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            
            VStack {
                
                //label & number
                InstructionView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100 )
                
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game:$game)
                        .transition(.scale)
                } else {
                    HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                    
                    
                }
            }
            if !alertIsVisible {
                //Slider
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct InstructionView : View {
    @Binding var game : Game
    
    var body: some View {
        
        VStack {
            InstructionText(text: "🎯🎯🎯\n PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            
            BigNumberText(text:String(game.target))
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
        
        //added landscape mode
        ContentView().previewLayout(.fixed(width: 568, height: 320))
        
        //dark mode
        ContentView()
            .preferredColorScheme(.dark)
        
        //added landscape mode
        ContentView().previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
