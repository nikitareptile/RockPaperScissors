//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Никита Тихонюк on 08.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var score = 0
    @State private var highscore = 0
    @State private var playerHand = "✊"
    @State private var aiHand = "✌️"
    @State private var result = true
    private let winColor = Color(.systemGreen)
    private let loseColor = Color(.systemRed)
    
    var body: some View {
        VStack {
            HStack {
                Text("✊")
                    .font(.title)
                Text("✋")
                    .font(.title)
                Text("✌️")
                    .font(.title)
            }
            Text("The game")
                .font(.title2)
                .fontWeight(.semibold)
            Divider()
                .frame(width: 1000.0)
                .ignoresSafeArea()
            Spacer()
            ZStack {
                Circle()
                    .stroke(winColor, lineWidth: 14)
                    .scaleEffect(0.96)
                    
                HStack {
                    Spacer()
                    VStack {
                        Text(playerHand)
                            .font(.system(size: 120))
                            .padding(.bottom)
                        Text("You")
                            .font(.title)
                            .fontWeight(.heavy)
                    }
                    Spacer()
                    VStack {
                        Text(aiHand)
                            .font(.system(size: 120))
                            .padding(.bottom)
                        Text("AI")
                            .font(.title)
                            .fontWeight(.heavy)
                    }
                    Spacer()
                }
            }
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        playerHand = "✊"
                    }, label: {
                        Text("✊")
                            .font(.system(size: 80))
                    })
                    Spacer()
                    Button(action: {
                        playerHand = "✋"
                    }, label: {
                        Text("✋")
                            .font(.system(size: 80))
                    })
                    Spacer()
                    Button(action: {
                        playerHand = "✌️"
                    }, label: {
                        Text("✌️")
                            .font(.system(size: 80))
                    })
                    Spacer()
                }
                .padding(.bottom)
                Text("Choose next")
            }
            Spacer()
            Divider()
                .frame(width: 1000.0)
                .ignoresSafeArea()
                .padding(.bottom)
            VStack {
                Text("Current score is \(score)")
                Text("Your highscore is \(highscore)")
            }
        }
        .padding()
    }
    
    func compareAiStepWith(HumanStep _: String) {
        let hands = ["✊", "✋", "✌️"]
        let aiStep = hands.randomElement()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
