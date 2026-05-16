//
//  Untitled.swift
//  TimesMe
//
//  Created by Douglas Webb on 4/29/26.
//

import SwiftUI

struct PlayGame: View{
    
    
    let sentTables :[Int]
    
    
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
                
            
            
            Button("Enter"){
                
                let intAnswerField = Int(answerField)
            
                if intAnswerField == questionSet[questionNumber].answer{
                    messageInWindow = true
                    let correcMessage = correctOptons.randomElement()
                    
                    answerField = correcMessage ?? "Right!"
                    
                    //TODO: right logic
                    questionSet[questionNumber].correct += 1
                    questionSet[questionNumber].adaptiveDifficulty = (questionSet[questionNumber].adaptiveDifficulty * 0.9) - 0.1
                    
                }else{
                    messageInWindow = true
                    
                    var wrongMessage = wrongOptions.randomElement()
                    
                    if wrongMessage == "X"{
                        
                        wrongMessage = "The right answer is \(questionSet[questionNumber].answer)"
                        
                    }
        
                    answerField = wrongMessage ?? "Wrong"
                    
                    //TODO: wrong logic
                    questionSet[questionNumber].incorrect += 1
                    questionSet[questionNumber].adaptiveDifficulty = (questionSet[questionNumber].adaptiveDifficulty * 0.9) + 0.1
                }
                
                print("The next question event has been triggered!")
                print("THe question set is : \(questionSet)")
                
                
                //TODO: So here is the algorythm ask the question, record the answer and up
                //date the array, add another question and then set the next one based on the highest wrong weighted ratio.
                //youre gonne need to check for duplicate ids
                
                
                
                if questionSet.count<=1{
                    
                }
                
               
                
            }.background{Image("button_blue_rectangle")}
                .padding(30)
                .foregroundColor(.white)
                .font(.custom(applicationFont, size: 30))
        
        }.onAppear{
            
            //questionSet = makeQuestions(factor: sentTables)
            
            // This needs to append a new questionto the question set on start up.
            
            questionSet.append(makeQuestions(factor: sentTables))
            
            
        }
    }

    
}

func makeQuestions(factor: [Int]) -> singleQuestion{
   
        //This makes one question
        
        let firstRandomFactor = Int.random(in: 0...10)
        let secondFactor = factor.randomElement() ?? 0
        var temporaryFactorArray = [firstRandomFactor, secondFactor]
        temporaryFactorArray.shuffle()
        
        return (singleQuestion(questionID: temporaryFactorArray, factors: temporaryFactorArray))

}

#Preview{
    PlayGame(sentTables: [0,2,3,4])
}
