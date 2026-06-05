//
//  Untitled.swift
//  TimesMe
//
//  Created by Douglas Webb on 4/29/26.
//

import SwiftUI
import AVFoundation

struct PlayGame: View{
    
    
    let sentTables :[Int]
    
    @State private var questionNumber = 0
    @State private var questionsAreSet = false
    @State private var answerField :String = ""
    @State private var messageInWindow :Bool = false
    @State private var questionCount = 1
    @State private var audioPlayer :AVAudioPlayer?
    @State private var winStreak: Int = 0
    
    
    var body: some View{
        
        VStack{
            
            Text("What is?")
                .font(.custom(applicationFont, size: 30))
                .padding(.bottom, 15)
            
            if questionsAreSet && !masterQuestionSet.isEmpty{
                
                Text("\(masterQuestionSet[questionNumber].factors[0]) X \(masterQuestionSet[questionNumber].factors[1]) =")
                    .font(.custom(applicationFont, size: 30))
                    .padding(.bottom, 15)
            }else{
                Text("Hang on, writing questions.")
            }
            
            Text(answerField)
                .font(.custom(applicationFont, size: 30))
                .padding(.bottom, 15)
            
            HStack{
                Button{
                    playSwitchSound()
                    
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
                    playSwitchSound()
                    
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
                    playSwitchSound()
                    
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
                    playSwitchSound()
                    
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
                    playSwitchSound()
                    
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
                    playSwitchSound()
                    
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
                    playSwitchSound()
                    
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
                    playSwitchSound()
                    
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
                    playSwitchSound()
                    
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
                    playSwitchSound()
                    
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
                playSwitchSound()
                
                answerField = ""
                
            } label: {Text(String("Clear"))}
                .background{Image("button_rectangle_gloss")}
                .font(.custom(applicationFont, size: 30))
                .padding(25)
            
            
            
            Button("Enter"){
                playSwitchSound()
                
                let intAnswerField = Int(answerField)
                
                if intAnswerField == masterQuestionSet[questionNumber].answer{
                    
                    winStreak += 1
                    
                    if winStreak < 5{
                        playWinSound()
                        messageInWindow = true
                        let correcMessage = correctOptons.randomElement()
                        
                        answerField = correcMessage ?? "Right!"
                    }else{
                        StreakLevel1Sound()
                        messageInWindow = true
                        answerField = streakOptions.randomElement() ?? "Keep it going"
                    }
                    
                    //TODO: sreak need to be reset when you get one wrong!
                    //use modulo to get units that are divisible by 5
                
                    //right adaptiveDificulty advanced
                    masterQuestionSet[questionNumber].correct += 1
                    masterQuestionSet[questionNumber].adaptiveDifficulty = (masterQuestionSet[questionNumber].adaptiveDifficulty * 0.9) - 0.1
                    
                }else{
                    winStreak = 0
                    messageInWindow = true
                    playLoseSound()
                    
                    var wrongMessage = wrongOptions.randomElement()
                    
                    if wrongMessage == "X"{
                        
                        wrongMessage = "The right answer is \(masterQuestionSet[questionNumber].answer)"
                        
                    }
                    
                    answerField = wrongMessage ?? "Wrong"
                    
                    //wrong logic
                    masterQuestionSet[questionNumber].incorrect += 1
                    masterQuestionSet[questionNumber].adaptiveDifficulty = (masterQuestionSet[questionNumber].adaptiveDifficulty * 0.9) + 0.1
                }
                
                masterQuestionSet[questionNumber].attempts += 1
                questionCount += 1
                
                if questionCount < 3 { // checks to see if its the first 2 questions
                
                    //first two questions
                    questionNumber = Int.random(in: 0...(masterQuestionSet.count))
                    
                }else{
                    
                    if questionCount % 3 == 0{
                        
                        questionNumber = masterQuestionSet.indices.max(by: {
                            
                            masterQuestionSet[$0].adaptiveDifficulty < masterQuestionSet[$1].adaptiveDifficulty
                    
                        })!
                        
                        // should choose the least correct score
                    }else{
                        
                        //TODO: this is where you left off, i dopnt thinkl attempts is incrementing there fore the first question keeps coming up.
                        
                        questionNumber = masterQuestionSet.indices.min(by: {
                            
                            masterQuestionSet[$0].attempts < masterQuestionSet[$1].attempts
                    
                        })!
                        
                    }
                }
                
                
             }.background{Image("button_blue_rectangle")}
                .padding(30)
                .foregroundColor(.white)
                .font(.custom(applicationFont, size: 30))
        
        }
            .onAppear{
                makeQuestions(factor: sentTables)
                questionsAreSet = true
            }
            .onDisappear{
                masterQuestionSet = []
            }
    }
    
    //THis funtion plays he click sound via AVPlayer
    func playSwitchSound() {
        if let url = Bundle.main.url(forResource: "clickSound", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error playing sound")
                print("AVAudioPlayer error: \(error)")
            }
        }
    }
    
    //THis funtion plays he win sound via AVPlayer
    func playWinSound() {
        if let url = Bundle.main.url(forResource: "win2", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error playing sound")
                print("AVAudioPlayer error: \(error)")
            }
        }
    }
    
    //THis funtion plays he lose sound via AVPlayer
    func playLoseSound() {
        if let url = Bundle.main.url(forResource: "lose", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error playing sound")
                print("AVAudioPlayer error: \(error)")
            }
        }
    }
    
    //THis funtion plays he lose sound via AVPlayer
    func StreakLevel1Sound() {
        if let url = Bundle.main.url(forResource: "win", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error playing sound")
                print("AVAudioPlayer error: \(error)")
            }
        }
    }
    
}
    


func makeQuestions(factor: [Int]){
   

    for singleFactor in factor{
        
        for otherNumber in stride(from: 1, through: 12, by: 1){
            
            let temporaryFactorArray = [singleFactor,otherNumber]
            
            masterQuestionSet.append(singleQuestion(questionID: temporaryFactorArray, factors: temporaryFactorArray))
            
        }
        
    }
    
    
    
    
}

#Preview{
    PlayGame(sentTables: [0,2,3,4])
}
