//
//  ContentView.swift
//  TimesMe
//
//  Created by Douglas Webb on 4/29/26.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State private var audioPlayer: AVAudioPlayer?
    
    @State private var includeTables: [Int] = [0]
    @State private var questionQuantitiy = 1
    
    var body: some View {
        NavigationStack{
            
            VStack{
                Text("Practice your times tables!")
                    .font(.custom("Kenney Future Narrow", size: 24))
                
                Text("Which tables do you want to practice?")
                
                
                HStack{
                    Button{
                        includeTableFunction(selectedNumber: 1)
                    } label: {Text(String(1))}.foregroundColor(includeTables.contains(1) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom("Kenney Future Narrow", size: 30))
                        .padding(25)
                    Button{
                        includeTableFunction(selectedNumber: 2)
                    } label: {Text(String(2))}.foregroundColor(includeTables.contains(2) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom("Kenney Future Narrow", size: 30))
                        .padding(25)
                    Button{
                        includeTableFunction(selectedNumber: 3)
                    } label: {Text(String(3))}.foregroundColor(includeTables.contains(3) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom("Kenney Future Narrow", size: 30))
                        .padding(25)
                    
                }
                
                HStack{
                    Button{
                        includeTableFunction(selectedNumber: 4)
                    } label: {Text(String(4))}.foregroundColor(includeTables.contains(4) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom("Kenney Future Narrow", size: 30))
                        .padding(25)
                    Button{
                        includeTableFunction(selectedNumber: 5)
                    } label: {Text(String(5))}.foregroundColor(includeTables.contains(5) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom("Kenney Future Narrow", size: 30))
                        .padding(25)
                    Button{
                        includeTableFunction(selectedNumber: 6)
                    } label: {Text(String(6))}.foregroundColor(includeTables.contains(6) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom("Kenney Future Narrow", size: 30))
                        .padding(25)
                    
                    
                }
                
                HStack{
                    Button{
                        includeTableFunction(selectedNumber: 7)
                    } label: {Text(String(7))}.foregroundColor(includeTables.contains(7) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom("Kenney Future Narrow", size: 30))
                        .padding(25)
                    Button{
                        includeTableFunction(selectedNumber: 8)
                    } label: {Text(String(8))}.foregroundColor(includeTables.contains(8) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom("Kenney Future Narrow", size: 30))
                        .padding(25)
                    Button{
                        includeTableFunction(selectedNumber: 9)
                    } label: {Text(String(9))}.foregroundColor(includeTables.contains(9) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom("Kenney Future Narrow", size: 30))
                        .padding(25)
                    
                }
                
                
            }
            
            
            Text("\(questionQuantitiy) Questions")
            
            Stepper("How many Questions do you want?", value: $questionQuantitiy)
            
            
            
            NavigationLink("Go to other screen"){
                
                PlayGame(sentTables: includeTables, numberOfQuestions: questionQuantitiy)
                
            }
            
        }
        .padding()
    }
    
    
    //This is the function that manages the includeTabe Selection:
    func includeTableFunction(selectedNumber: Int){
        
        playSwitchSound()
        
        if includeTables.contains(selectedNumber){
            
            if let index = includeTables.firstIndex(of: selectedNumber) {
                includeTables.remove(at: index)
            }
        }else{
            includeTables.append(selectedNumber)
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
    
    
    
    
    
    
    
    
}





#Preview {
    ContentView()
}
