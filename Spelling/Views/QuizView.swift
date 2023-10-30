//
//  QuizView.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import SwiftUI

enum Outcome: String {
    case undetermined = "XXXXXXXX"
    case correct = "✅"
    case incorrect = "❌"
}

struct QuizView: View {
    
   
    
    // MARK: Stored properties
    @State var currentItem = itemsToSpell.randomElement()!
    @State var userGuess = ""
    @State var awnser = ""
    @State  var currentOutCome: Outcome = .undetermined
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            Text("\(awnser)")
            
            Image(currentItem.imageName)
                .resizable()
                .scaledToFit()
            HStack {
                HStack {
                    TextField("enter word here", text: $userGuess)
                    Text(currentOutCome.rawValue)
                }
                
                (Button(action: {
                    checkGuess()
                }, label: {
                    Text("Button")
                }))
            }
            .padding()
        }
    }
    func checkGuess() {
        if userGuess == currentItem.word{
            currentOutCome = .correct
            currentOutCome = .undetermined
            currentItem = items
            
        userGuess = ""
        } else {
            currentOutCome = .incorrect
        }
            
    }
}

#Preview {
    QuizView()
}
