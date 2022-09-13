//
//  TextViews.swift
//  Bulls Eye
//
//  Created by Celil Çağatay Gedik on 10.09.2022.
//a

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
            withAnimation{
                self.alertIsVisible = true
            }
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
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .overlay(
            
            RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
            
        )
        
        
        
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

struct ScoreText: View {
    var score: Int
    
    var body:some View{
        Text(String(score))
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
            .kerning(-0.2)
        
    }
}

struct DateText: View {
    var date: Date
    
    var body:some View{
        Text(date, style: .time)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
            .kerning(-0.2)
        
    }
}

struct BigBoldText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
            .kerning(2.0)
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
            ScoreText(score: 19)
            DateText(date: Date())
            BigBoldText(text: "leaderboard")
        }
        .padding()
    }
}

