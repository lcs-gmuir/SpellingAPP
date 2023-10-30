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
    @State var history: [result] = []
    
    // MARK: Computed properties
    var body: some View {
        HStack {
            List(history) { currentResult in
                HStack{
                    Image(currentResult.item.imageName)
                        .resizable()
                        .scaledToFit()
                    
                    Text(currentResult.guessProvided)
                         Spacer()
                         
                         Text(currentResult.outcome.rawValue)
                }
                
            }
            VStack {
                Text("\(awnser)")
                
                Image(currentItem.imageName)
                    .resizable()
                    .scaledToFit()
                HStack {
                    HStack {
                        TextField("enter word here", text: $userGuess).onSubmit {
                            checkGuess()
                            
                        }
                        Text(currentOutCome.rawValue)
                    }
                }
                .padding()
            }
        }
        
    }
    
    func checkGuess() {
        if userGuess == currentItem.word{
            currentOutCome = .correct
            history.insert(result(item: currentItem, guessProvided: userGuess, outcome: currentOutCome),at: 0)
            currentOutCome = .undetermined
            currentItem = itemsToSpell.randomElement()!
          
        userGuess = ""
        } else {
            currentOutCome = .incorrect
        }
            
    }
}

#Preview {
    QuizView()
}
