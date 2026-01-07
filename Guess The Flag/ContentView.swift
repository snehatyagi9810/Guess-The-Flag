//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Sneha Tyagi on 06/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle  = ""
    
    @State private var score = 0
    @State private var scoreMessage  = ""
    @State private var numberOfQuestion = 0
    
    @State private var finalScore = false
    
    
    var body: some View {
        ZStack{
            RadialGradient(stops:[.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                                  .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)] , center: .top, startRadius: 200, endRadius: 700)
            VStack{
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                
                
                VStack(spacing: 15){
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3){ number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                
                Text( "Score \(score)")
                    .foregroundStyle(.white)
                    .font(.largeTitle.bold())
                
                
                Spacer()
            }
            
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            if scoreTitle == "Correct" {
                Text(scoreMessage)
            }else if  scoreTitle == "Wrong"{
                Text(scoreMessage)
            }
            
        }
        
        .alert("Game Over", isPresented: $finalScore) {
            Button("Restart") {
                restartGame()
            }
        } message: {
            Text(finalMessage())
        }
        .ignoresSafeArea()
        
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreMessage = "Yes you get it right"
            score += 1
        } else {
            scoreTitle = "Wrong"
            scoreMessage = "That’s the flag of \(countries[number])"
            if score>0 {
                score -= 1
            }
            
        }
        numberOfQuestion += 1
        showingScore = true
    }
    
    func askQuestion(){
        if numberOfQuestion == 8 {
            finalScore = true
        }
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func restartGame() {
        score = 0
        numberOfQuestion = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func finalMessage() -> String {
        if score >= 6 {
            return "Excellent! Your score is \(score)/8 🏆"
        } else if score >= 4 {
            return "Good job! Your score is \(score)/8 👍"
        } else {
            return "Keep practicing! Your score is \(score)/8 💪"
        }
    }

}

#Preview {
    ContentView()
}
