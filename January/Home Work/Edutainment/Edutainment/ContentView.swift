//
//  ContentView.swift
//  Edutainment
//
//  Created by mac on 1/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var multiNums = 2
    @State private var score = 0
    @State private var questions: [Question] = []
    @State private var roundOn = 1
    @State private var questionCount = 5
    // array of questions
    @State private var guess: Int? = nil
    @State private var gameIsActive = false
    let questionsNum = [5, 10, 20]
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .clear], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Section {
                    HStack {
                        Text("Select your multiples")
                        Stepper("\(multiNums)", value: $multiNums, in: 2...12, step: 1)
                            .fixedSize()
                    }
                }
                Section {
                    Picker("Questions", selection: $questionCount) {
                        ForEach(questionsNum, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How many questions do you want??")
                }
                
                Section {
                    Button(action: startGame) {
                        Text("Start")
//                        gameIsActive = true i think thats needed here. I added it to the func
                        
                    }
                    if let currentQuestion = questions.last {
                        Text("What is \(currentQuestion.firstNumber) X \(currentQuestion.secondNumber)")
                        
                        Text("Score is \(score)")
                        
                        List(currentQuestion.allAnswers, id: \.self) { answer in
                            Text(String(answer))
                                .onTapGesture {
                                    respondToAnswer(answer: answer)
                                }
                                .listRowBackground(guess == answer ? Color.green : Color.clear
)
                        }
                    }
                }
                Spacer()
//                Example code word thingy
                // Section
//                if let last = questions.last {
//                    display possible answers for that qestion
//                                                    answer
//                                                    func answer TAPPED
                                                    // pop questions.removeLast
                }
            }
        }
    
//        after start button, brings up 4 buttons. With a question for you to answer.
//        some way to show if youre right or wrong.
        
//        array of questions.
//        show score of questions right or wrong, for end game alert. Start over.
        
        
        
        
    
    func startGame() {
        makeQuestions(count: questionCount, max: multiNums)
    }
    
    func makeQuestions(count: Int, max: Int) {
        for _ in 0...count {
            questions.append(Question(max: max))
        }
    }
    
    func respondToAnswer(answer: Int) {
        guard roundOn < questionCount else {
            return
        }
        
        if answer == questions.last?.corectAnswer {
            guess = answer
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                questions.removeLast()
                guess = nil
                score += 1
                roundOn += 1
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                questions.removeLast()
                guess = nil
                score -= 1
                roundOn -= 1
            }
        }
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
