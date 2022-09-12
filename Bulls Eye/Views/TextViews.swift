//
//  TextViews.swift
//  Bulls Eye
//
//  Created by Celil Çağatay Gedik on 10.09.2022.
//

import SwiftUI

struct InstructionText: View {
    
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
            .frame(width: 35.0)
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
        .overlay(
        
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
                
        )
        
        
        //pop-up button
        .alert(
          "Hello there!",
          isPresented: $alertIsVisible,
          presenting: {
            let roundedValue = Int(sliderValue.rounded())
            return (
              roundedValue,
              game.points(sliderValue: roundedValue)
            )
          } () as (roundedValue: Int, points: Int)
        ) { data in
          Button("Awesome!") {
            game.startNewRound(points: data.points)
          }
        } message: { data in
          Text("The slider's value is \(data.roundedValue).\n" + "You scored \(data.points) points this round.")
        }
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
       Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
            .font(.caption)
}
}
    
    struct BodyText: View {
        var text: String
        
        var body:some View{
            Text(text)
                .fontWeight(.semibold)
                .font(.subheadline)
                .foregroundColor(Color("TextColor"))
                .multilineTextAlignment(.center)
                .lineSpacing(12.0)
        }
    }

    
    struct ButtonText: View {
        var text: String
        
        var body:some View{
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    Color.accentColor
                )
                .cornerRadius(12)
        }
    }



struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            SliderLabelText(text: "999")
            LabelText(text: "9")
            BodyText(text: "You scored 200 points\n 🎉🎉🎉")
            ButtonText(text: "Start New Round")
        }
        .padding()
    }
}

