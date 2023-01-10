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
            
            ZStack {
                Circle()
                    .foregroundColor(.green)
                
                Circle()
                    .foregroundColor(.white)
                    .scaleEffect(0.92)
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Text("✊")
                            .font(.system(size: 120))
                            .padding(.bottom)
                        Text("You")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("✌️")
                            .font(.system(size: 120))
                            .padding(.bottom)
                        Text("AI")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.black)
                    }
                    
                    Spacer()
                }
            }
            
            Spacer()
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("✊")
                            .font(.system(size: 80))
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("✋")
                            .font(.system(size: 80))
                    })
                    Spacer()
                    
                    Button(action: {
                        
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
                .padding(.bottom)
                
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
