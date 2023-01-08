//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Никита Тихонюк on 08.01.2023.
//

import SwiftUI

struct ContentView: View {
    var score = 0
    var highscore = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("✊")
                    .font(.largeTitle)
                Text("✋")
                    .font(.largeTitle)
                Text("✌️")
                    .font(.largeTitle)
            }
            Text("The game")
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
            HStack {
                Spacer()
                VStack {
                    Text("✊")
                        .font(.system(size: 100))
                    Text("You")
                }
                Spacer()
                VStack {
                    Text("✌️")
                        .font(.system(size: 100))
                    Text("Opponent")
                }
                Spacer()
            }
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    Text("✊")
                        .font(.system(size: 80))
                    Spacer()
                    Text("✋")
                        .font(.system(size: 80))
                    Spacer()
                    Text("✌️")
                        .font(.system(size: 80))
                    Spacer()
                }
                Text("Choose next")
            }
            Spacer()
            VStack {
                Text("Current score is \(score)")
                Text("Your highscore is \(highscore)")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
