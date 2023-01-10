//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Никита Тихонюк on 08.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    let defaults = UserDefaults.standard
    
    @State private var score = 0
    @State private var localHighscore = 0
    @State private var playerHand = "✊"
    @State private var aiHand = "✌️"
    @State private var result = ""
    @State private var colorOfCircle = Color(.white)
    
    @State private var aiHandAnimation = false
    @State private var playerHandAnimation = false
    
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
                            .offset(x: playerHandAnimation ? 40 : 0, y: 0)
                            .rotationEffect(Angle(degrees: playerHandAnimation ? 20 : 0))
                        Text("You")
                            .font(.title)
                            .fontWeight(.heavy)
                    }
                    Spacer()
                    VStack {
                        Text(aiHand)
                            .font(.system(size: 120))
                            .padding(.bottom)
                            .offset(x: aiHandAnimation ? -40 : 0, y: 0)
                            .rotationEffect(Angle(degrees: aiHandAnimation ? -20 : 0))
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
                        withAnimation(.spring(response: 0.2, dampingFraction: 0.5)) {
                            aiHandAnimation.toggle()
                            playerHandAnimation.toggle()
                        }
                        playerHand = "✊"
                        gameClick()
                        withAnimation() {
                            aiHandAnimation.toggle()
                            playerHandAnimation.toggle()
                        }
                    }, label: {
                        Text("✊")
                            .font(.system(size: 80))
                    })
                    Spacer()
                    Button(action: {
                        withAnimation(.spring(response: 0.2, dampingFraction: 0.5)) {
                            aiHandAnimation.toggle()
                            playerHandAnimation.toggle()
                        }
                        playerHand = "✋"
                        gameClick()
                        withAnimation() {
                            aiHandAnimation.toggle()
                            playerHandAnimation.toggle()
                        }
                    }, label: {
                        Text("✋")
                            .font(.system(size: 80))
                    })
                    Spacer()
                    Button(action: {
                        withAnimation(.spring(response: 0.2, dampingFraction: 0.5)) {
                            aiHandAnimation.toggle()
                            playerHandAnimation.toggle()
                        }
                        playerHand = "✌️"
                        gameClick()
                        withAnimation() {
                            aiHandAnimation.toggle()
                            playerHandAnimation.toggle()
                        }
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
                Text("Your highscore is " + String(getHighscore()))
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
        if result == "win" {
            colorOfCircle = Color(.systemGreen)
        } else if result == "draw" {
            colorOfCircle = Color(.lightGray)
        } else {
            colorOfCircle = Color(.systemRed)
        }
    }
    
    func saveHighscoreFrom(currentScore: Int) {
        if currentScore > getHighscore() {
            defaults.set(currentScore, forKey: "highscore")
        }
    }
    
    func getHighscore() -> Int {
        if defaults.integer(forKey: "highscore") != 0 {
            return defaults.integer(forKey: "highscore")
        } else {
            return 0
        }
    }
    
    func updateLocalHighscore() {
        if localHighscore < score {
            localHighscore += 1
        }
    }
    
    func gameClick() {
        compareHands()
        winOrLoseColor()
        updateLocalHighscore()
        saveHighscoreFrom(currentScore: localHighscore)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
