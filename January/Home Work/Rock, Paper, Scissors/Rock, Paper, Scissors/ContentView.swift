//
//  ContentView.swift
//  Rock, Paper, Scissors
//
//  Created by mac on 1/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rockPaperScissors = ["Rock", "Paper", "Scissors"]
    @State private var showingScore = false
    
    
    
    @State private var winOrLose = ["Win", "Lose"]
    
    @State private var playerScore: Int = 0
    
    @State private var scoreTitle = ""
    
    @State private var randomPick = Int.random(in: 0...2)
    @State private var randomPick2 = Int.random(in: 0...1)
    
    func checkWinOrLose(player: String, computer: String) -> Bool {
        
        switch player {
        case "Rock":
            return (computer == "Scissors") ? true : false
        case "Paper":
            return (computer == "Rock") ? true : false
        case "Scissors":
            return (computer == "Paper") ? true : false
        default: Bool.random()
        }
        
        return true
        
    }
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.mint, .green]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Text("The hivemind picked")
                    .font(.system(size: 20))
                Text(rockPaperScissors[randomPick])
                    .font(.system(size: 40))
                Text("You need to \(winOrLose[randomPick2])")
                    .font(.system(size: 20))
                Spacer()
            }.padding()
            VStack(spacing: 70) {
                
                ForEach(0..<3) { number in
                    Button(rockPaperScissors[number]) {
                        let player = rockPaperScissors[number]
                        let computer = rockPaperScissors[randomPick]
                        
                        //if you need to win
                        if randomPick2 == 0 {
                            
                            //if player won
                            if checkWinOrLose(player: player, computer: computer) {
                                playerScore += 1
                            }
                            
                            
                            //if you need to lose
                        } else if randomPick2 == 1 {
                            //if player lost
                            if !checkWinOrLose(player: player, computer: computer) {
                                playerScore += 1
                            }
                        }
                        resetGame()
                    }
                    

                    }
                }
                    VStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Text("Your score is \(playerScore)")
                        Spacer()
                    
                }
            }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("contiue", action: resetGame)
        }
        }
    
    func resetGame() {
        rockPaperScissors.shuffle()
        winOrLose.shuffle()
        randomPick2 = Int.random(in: 0...1)
        randomPick = Int.random(in: 0..<2)
    }
    
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
