//
//  Untitled.swift
//  TimesMe
//
//  Created by Douglas Webb on 4/29/26.
//

import SwiftUI

struct PlayGame: View{
    
    
    let sentTables :[Int]
    let numberOfQuestions :Int
    
    @State private var questionSet :[singleQuestion] = []
    @State private var questionNumber = 0
    
    @State private var answerField :String = ""
    
    @State private var messageInWindow :Bool = false
    
    
    var body: some View{
        
        
        
        VStack{
            
            
            Text("What is?")
                .font(.custom(applicationFont, size: 30))
                .padding(.bottom, 15)
            
            if !questionSet.isEmpty{
                
                Text("\(questionSet[questionNumber].factors[0]) X \(questionSet[questionNumber].factors[1]) =")
                    .font(.custom(applicationFont, size: 30))
                    .padding(.bottom, 15)
            }else{
                Text("Hang on a Sec!")
            }
        
            
//            Text("The values sent are:")
//            
//            Text("PlayGame, the input value is \(sentTables)")
//            Text("The number of questions is: \(numberOfQuestions)")
//            
//            
//            if !questionSet.isEmpty {
//                Text("The first factor is \(questionSet[questionNumber].factors[0])")
//                Text("The second factor is \(questionSet[questionNumber].factors[1])")
//                Text("The anser is \(questionSet[questionNumber].answer)")
//                Text("The question number is \(questionNumber)")
//                
//              }
            
            
            Text(answerField)
                .font(.custom(applicationFont, size: 30))
                .padding(.bottom, 15)
            
            
            
            HStack{
                Button{
                    
                    if messageInWindow {
                        answerField = ""
                        messageInWindow = false
                    }
                    
                    answerField = answerField + "1"
                    
                } label: {Text(String(1))}
                    .background{Image("button_green")}
                    .font(.custom(applicationFont, size: 30))
                    .padding(25)
                
                Button{
                    
                    if messageInWindow {
                        answerField = ""
                        messageInWindow = false
                    }
                    
                    answerField = answerField + "2"
                    
                } label: {Text(String(2))}
                    .background{Image("button_green")}
                    .font(.custom(applicationFont, size: 30))
                    .padding(25)
                
                Button{
                    
                    if messageInWindow {
                        answerField = ""
                        messageInWindow = false
                    }
                    
                    answerField = answerField + "3"
                    
                } label: {Text(String(3))}
                    .background{Image("button_green")}
                    .font(.custom(applicationFont, size: 30))
                    .padding(25)
                
            }
            
            HStack{
                Button{
                    
                    if messageInWindow {
                        answerField = ""
                        messageInWindow = false
                    }
                    
                    answerField = answerField + "4"
                    
                } label: {Text(String(4))}
                    .background{Image("button_green")}
                    .font(.custom(applicationFont, size: 30))
                    .padding(25)
                
                Button{
                    
                    if messageInWindow {
                        answerField = ""
                        messageInWindow = false
                    }
                    
                    answerField = answerField + "5"
                    
                } label: {Text(String(5))}
                    .background{Image("button_green")}
                    .font(.custom(applicationFont, size: 30))
                    .padding(25)
                
                Button{
                    
                    if messageInWindow {
                        answerField = ""
                        messageInWindow = false
                    }
                    
                    answerField = answerField + "6"
                    
                } label: {Text(String(6))}
                    .background{Image("button_green")}
                    .font(.custom(applicationFont, size: 30))
                    .padding(25)
                
                
            }
            
            HStack{
                Button{
                    
                    if messageInWindow {
                        answerField = ""
                        messageInWindow = false
                    }
                
                    answerField = answerField + "7"
                    
                } label: {Text(String(7))}
                    .background{Image("button_green")}
                    .font(.custom(applicationFont, size: 30))
                    .padding(25)
                
                Button{
                    
                    if messageInWindow {
                        answerField = ""
                        messageInWindow = false
                    }
                    
                    answerField = answerField + "8"
                    
                } label: {Text(String(8))}
                    .background{Image("button_green")}
                    .font(.custom(applicationFont, size: 30))
                    .padding(25)
                
                Button{
                    
                    if messageInWindow {
                        answerField = ""
                        messageInWindow = false
                    }
                    
                    answerField = answerField + "9"
                    
                } label: {Text(String(9))}
                    .background{Image("button_green")}
                    .font(.custom(applicationFont, size: 30))
                    .padding(25)
    
            }
            
            HStack{
                Button{
                    
                    if messageInWindow {
                        answerField = ""
                        messageInWindow = false
                    }
                    
                    answerField = answerField + "0"
                    
                } label: {Text(String(0))}
                    .background{Image("button_green")}
                    .font(.custom(applicationFont, size: 30))
                    .padding(25)
                
                
            }
                Button{
                    
                    answerField = ""
                    
                } label: {Text(String("Clear"))}
                    .background{Image("button_rectangle_gloss")}
                    .font(.custom(applicationFont, size: 30))
                    .padding(25)
                
            
            
            Button("Go!"){
                
                let intAnswerField = Int(answerField)
            
                if intAnswerField == questionSet[questionNumber].answer{
                    messageInWindow = true
                    let correcMessage = correctOptons.randomElement()
                    
                    answerField = correcMessage ?? "Right!"
                }else{
                    messageInWindow = true
                    
                    var wrongMessage = wrongOptions.randomElement()
                    
                    if wrongMessage == "X"{
                        
                        wrongMessage = "The right answer is \(questionSet[questionNumber].answer)"
                        
                    }
        
                    answerField = wrongMessage ?? "Wrong"
                }
                
                
             
                if questionNumber < (questionSet.count - 1){
                    questionNumber += 1
                }else{
                    
                    // game over logic would go here.
                    
                    
                    questionNumber = 0
                    print("Game Over")
                }
                
                
                
            }.background{Image("button_blue_rectangle")}
                .padding(30)
                .foregroundColor(.white)
                .font(.custom(applicationFont, size: 30))
        
        }.onAppear{
            
            questionSet = makeQuestions(quantity: numberOfQuestions, factor: sentTables)
            
        }
    }

    
}

func makeQuestions(quantity: Int, factor: [Int]) -> [singleQuestion]{
    
    var temporaryQuestionSet : [singleQuestion] = []
    
    for _ in (1...quantity){
        
        let firstRandomFactor = Int.random(in: 0...10)
        let secondFactor = factor.randomElement() ?? 0
        var tempararyFactorArray = [firstRandomFactor, secondFactor]
        tempararyFactorArray.shuffle()
        
        temporaryQuestionSet.append(singleQuestion(factors: tempararyFactorArray))
    
    }
   
    return temporaryQuestionSet
    
}

#Preview{
    PlayGame(sentTables: [0,2,3,4], numberOfQuestions: 4)
}
