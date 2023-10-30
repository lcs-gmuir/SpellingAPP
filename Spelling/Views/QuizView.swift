//
//  QuizView.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import SwiftUI

struct QuizView: View {
    enum Outcome: String {
        
    }
    
    // MARK: Stored properties
    @State var currentItem = itemsToSpell.randomElement()!
    @State var userGuess = ""
    @State var awnser = ""
    // MARK: Computed properties
    var body: some View {
        
        VStack {
            Text("\(awnser)")
            
            Image(currentItem.imageName)
                .resizable()
                .scaledToFit()
            HStack {
                TextField("enter word here", text: $userGuess)
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
            awnser = "correct"
        userGuess = ""
        } else {
           awnser = "wrong"
        }
            
    }
}

#Preview {
    QuizView()
}
