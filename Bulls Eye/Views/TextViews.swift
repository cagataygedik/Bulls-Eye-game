//
//  TextViews.swift
//  Bulls Eye
//
//  Created by Celil Çağatay Gedik on 10.09.2022.
//

import SwiftUI

struct InstrucationText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .kerning(2.0)
            .font(.footnote)
            .fontWeight(.bold)
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .lineSpacing(4.0)
        
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .foregroundColor(Color("TextColor"))
            .kerning(-1.0)
            .fontWeight(.black)
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body:some View{
        Text(text)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderView : View {
    @Binding var sliderValue : Double
    
    
    var body: some View {
        
        
        HStack {
            SliderLabelText(text: "1")
            Slider(value: self.$sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct HitMeButtonView : View {
    @Binding var alertIsVisible : Bool
    @Binding var sliderValue : Double
    @Binding var game : Game
    
    var body: some View {
        Button(action: {
            self.alertIsVisible = true
        })  {
            Text("HIT ME")
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                
                //açık mordan koyu mora inanılmaz bir geçiş
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            })
        .foregroundColor(.white)
        .cornerRadius(21)
        
        
        //pop-up button
        .alert("Hello There!", isPresented: $alertIsVisible) {
            Button("Awesome") {}
        }  message: {
            let roundedValue = Int(sliderValue.rounded())
            Text("The slider's value is \(roundedValue). \n" + "You scored \(self.game.points(sliderValue: roundedValue)) points this round.")
        }
    }
}


struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstrucationText(text: "Instructions")
            BigNumberText(text: "999")
            SliderLabelText(text: "999")
            
        }
    }
}
