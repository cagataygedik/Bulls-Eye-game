//
//  Leaderboard.swift
//  Bulls Eye
//
//  Created by Celil Çağatay Gedik on 13.09.2022.
//aa


import SwiftUI

struct LeaderboardView: View {
    @Binding var game: Game
    @Binding var leaderboardIsShowing: Bool
    var body: some View {
        ScrollView(content: {
            ZStack {
                Color("BackgroundColor")
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 10){
                    HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                    LabelView()
                    VStack(spacing: 10){
                        ForEach(game.leaderboardEntries.indices) { i in
                            let leaderboardEntry = game.leaderboardEntries[i]
                            RowView(index: i+1, score: leaderboardEntry.score, date: leaderboardEntry.date)
                        }
                    }
                }
            }
        })
        
        
        
    }
}

struct RowView: View {
    var index: Int
    var score: Int
    var date: Date
    var body: some View {
        
        
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            
            DateText(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: 56.0)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
            
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
        
    }
}
struct HeaderView: View {
    @Environment (\.verticalSizeClass) var verticalSizeClass
    @Environment (\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderboardIsShowing: Bool
    
    var body: some View {
        ZStack{
            HStack{
                if verticalSizeClass == .regular && horizontalSizeClass == .compact{
                    
                    BigBoldText(text: "leaderboard")
                        .padding()
                    Spacer()
                }else{
                    BigBoldText(text: "leaderboard")
                    
                }
            }
            
            HStack{
                Spacer()
                Button(action: {
                    //close
                    leaderboardIsShowing = false
                }, label: {
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding()
                })
                
            }
        }
        
    }
}

struct LabelView: View {
    var body: some View {
        
        
        HStack{
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            
            LabelText(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            
            LabelText(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
            
        }.padding(.leading)
            .padding(.trailing)
            .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
        
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        LeaderboardView(game: game, leaderboardIsShowing: leaderboardIsShowing)
        LeaderboardView(game: game, leaderboardIsShowing: leaderboardIsShowing)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderboardView(game: game, leaderboardIsShowing: leaderboardIsShowing)
            .preferredColorScheme(.dark)
        LeaderboardView(game: game, leaderboardIsShowing: leaderboardIsShowing)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
    
}
