//
//  ContentView.swift
//  Bulls Eye
//
//  Created by Celil Çağatay Gedik on 9.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\n PUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .kerning(2.0)
                .font(.footnote)
                .fontWeight(.bold)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .lineSpacing(4.0)
            Text(String(game.target))
                .font(.largeTitle)
                .kerning(-1.0)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .fontWeight(.bold)
                Slider(value: self.$sliderValue, in: 1.0...100.0)
                Text("100")
                    .fontWeight(.bold)
            }
            
            //button
            Button(action: {
                self.alertIsVisible = true
            })  {
                Text("HIT ME")
            }
            
            //pop-up button
            .alert("Hello There!", isPresented: $alertIsVisible) {
                Button("Awesome") {}
            } message: {
                let roundedValue = Int(sliderValue.rounded())
                Text("The slider's value is \(roundedValue). \n" + "You scored \(self.game.points(sliderValue: roundedValue)) points this round.")
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        //added landscape mode
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
