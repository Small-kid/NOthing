//
//  ContentView.swift
//  Quiz
//
//  Created by JiaChen(: on 1/6/21.
//

import SwiftUI

struct ContentView: View {
    //i did a thing
var questions = [
    Question(title: "Where does the Paw Patrol live?", option1: "Rescue Bay", option2: "Foggy Bottoms", option3: "Adventure Bay", option4: "Meriden", image: "q1", correctOption: 3),
        Question(title: "What's the name of the Mayor?", option1: "Mayor Goodway", option2: "Mayor Alex", option3: "Mayor Jeff", option4: "Mayor Mickey", image: "q2", correctOption: 1),
        Question(title: "What kind of pet does Mayor Goodway have?", option1: "Dog", option2: "Chicken" , option3: "Horse", option4: "Cat", image: "q3", correctOption: 2),
        Question(title: "Which pup hates the water?", option1: "Zoomer", option2: "Skye", option3: "Rubble", option4: "Rocky", image: "q4", correctOption: 3)
    ]
    
    @State var currentQuestion = 0
    
    @State var correctAnswers = 0
    
    @State var isAlertPresented = false
    @State var isCorrect = false
    
    @State var isModalPresented = false
    
    var body: some View {
        VStack {
            ProgressView(value: Double(currentQuestion),
                                     total: Double(questions.count))
                            .padding()
            Text(questions[currentQuestion].title)
                .padding()
            HStack {
                VStack {
                        Button {
                            didTapOption(optionNumber: 1)
                        }label: {
                            Image(systemName: "circle.fill")
                            Text(questions[currentQuestion].option1)
                        }
                        Image(systemName: "square.fill")
                            .foregroundColor(.blue)
                    Button {
                        didTapOption(optionNumber: 2)
                    }label: {
                        Image(systemName: "square.fill")
                        Text(questions[currentQuestion].option2)
                    }
                }
                .padding()
                VStack {
                    Button {
                        didTapOption(optionNumber: 3)
                    }label: {
                        Image(systemName: "triangle.fill")
                        Text(questions[currentQuestion].option3)
                    }
                    Button {
                        didTapOption(optionNumber: 4)
                    }label: {
                        Image(systemName: "diamond.fill")
                        Text(questions[currentQuestion].option4)
                    }                }
                .padding()
            }
            .padding()
        }
        .alert(isPresented: $isAlertPresented) {
            
            Alert(title: Text(isCorrect ? "Correct" : "Wrong"),
                  message: Text(isCorrect ? "Congrats comrade, the state thanks your contribution to *our* progress." : "You disappointing failure."),
                  dismissButton: .default(Text("OK")) {
                    currentQuestion += 1
                    
                    if currentQuestion == questions.count {
                        isModalPresented = true
                        currentQuestion = 0
                    }
                  })
        }.sheet(isPresented: $isModalPresented) {
            ResultsScreen(score: correctAnswers, totalQuestions: questions.count)
        }
    }
    
    func didTapOption(optionNumber: Int) {
        if optionNumber == questions[currentQuestion].correctOption {
            print("Correct!")
            isCorrect = true
            correctAnswers += 1
        } else {
            print("Wrong!")
            isCorrect = false
        }
        isAlertPresented = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
