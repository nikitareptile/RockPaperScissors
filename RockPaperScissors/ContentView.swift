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
    @State private var result = ""
    @State private var colorOfCircle = Color(.white)
    
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
                    .stroke(colorOfCircle, lineWidth: 14)
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
                        compareHands()
                        winOrLoseColor()
                        detectHighscore()
                    }, label: {
                        Text("✊")
                            .font(.system(size: 80))
                    })
                    Spacer()
                    Button(action: {
                        playerHand = "✋"
                        compareHands()
                        winOrLoseColor()
                        detectHighscore()
                    }, label: {
                        Text("✋")
                            .font(.system(size: 80))
                    })
                    Spacer()
                    Button(action: {
                        playerHand = "✌️"
                        compareHands()
                        winOrLoseColor()
                        detectHighscore()
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
    
    func compareHands() {
        let hands = ["✊", "✋", "✌️"]
        aiHand = hands.randomElement()!
        
        if (playerHand == aiHand) {
            result = "draw"
        } else {
            switch (playerHand, aiHand) {
            case ("✌️", "✋"):
                result = "win"
                score += 1
            case ("✊", "✌️"):
                result = "win"
                score += 1
            case ("✋", "✊"):
                result = "win"
                score += 1
            default:
                result = "lose"
            }
        }
        
    }
    
    func winOrLoseColor() {
        let winColor = Color(.systemGreen)
        let loseColor = Color(.systemRed)
        let drawColor = Color(.lightGray)
        
        if result == "win" {
            colorOfCircle = winColor
        } else if result == "draw" {
            colorOfCircle = drawColor
        } else {
            colorOfCircle = loseColor
        }
    }
    
    func detectHighscore() {
        if score > highscore {
            highscore += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
