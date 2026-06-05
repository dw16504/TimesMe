//
//  ContentView.swift
//  TimesMe
//
//  Created by Douglas Webb on 4/29/26.
//  Last Man Branch Save Point 9:12 AM 5/13/2026

import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State private var audioPlayer: AVAudioPlayer?
    @State private var includeTables: [Int] = []
    @State private var goToGame = false
    
    
    var body: some View {
        NavigationStack{
            
            VStack{
                Text("Practice your times tables!")
                    .font(.custom(applicationFont, size: 24))
                
                Text("Which tables do you want to practice?")
                    .font(.custom(applicationFont, size: 17))
                HStack{
                    Button{
                        includeTableFunction(selectedNumber: 1)
                    
                    } label: {Text(String(1))}.foregroundColor(includeTables.contains(1) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom(applicationFont, size: 30))
                        .padding(25)
               
                    Button{
                        includeTableFunction(selectedNumber: 2)
                    } label: {Text(String(2))}.foregroundColor(includeTables.contains(2) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom(applicationFont, size: 30))
                        .padding(25)
                     
                    Button{
                        includeTableFunction(selectedNumber: 3)
                    } label: {Text(String(3))}.foregroundColor(includeTables.contains(3) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom(applicationFont, size: 30))
                        .padding(25)
                    
                }
                
                HStack{
                    Button{
                        includeTableFunction(selectedNumber: 4)
                    } label: {Text(String(4))}.foregroundColor(includeTables.contains(4) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom(applicationFont, size: 30))
                        .padding(25)
        
                    Button{
                        includeTableFunction(selectedNumber: 5)
                    } label: {Text(String(5))}.foregroundColor(includeTables.contains(5) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom(applicationFont, size: 30))
                        .padding(25)
                    Button{
                        includeTableFunction(selectedNumber: 6)
                    } label: {Text(String(6))}.foregroundColor(includeTables.contains(6) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom(applicationFont, size: 30))
                        .padding(25)
                    
                    
                }
                
                HStack{
                    Button{
                        includeTableFunction(selectedNumber: 7)
                    } label: {Text(String(7))}.foregroundColor(includeTables.contains(7) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom(applicationFont, size: 30))
                        .padding(25)
                    Button{
                        includeTableFunction(selectedNumber: 8)
                    } label: {Text(String(8))}.foregroundColor(includeTables.contains(8) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom(applicationFont, size: 30))
                        .padding(25)
                    Button{
                        includeTableFunction(selectedNumber: 9)
                    } label: {Text(String(9))}.foregroundColor(includeTables.contains(9) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom(applicationFont, size: 30))
                        .padding(25)
                    
                }
                
                HStack{
                    Button{
                        includeTableFunction(selectedNumber: 10)
                    } label: {Text(String(10))}.foregroundColor(includeTables.contains(10) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom(applicationFont, size: 30))
                        .padding(.vertical, 25)
                        .padding(.horizontal, 20)
                    Button{
                        includeTableFunction(selectedNumber: 11)
                    } label: {Text(String(11))}.foregroundColor(includeTables.contains(11) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom(applicationFont, size: 30))
                        .padding(.vertical, 25)
                        .padding(.horizontal, 20)
                    Button{
                        includeTableFunction(selectedNumber: 12)
                    } label: {Text(String(12))}.foregroundColor(includeTables.contains(12) ? .red : .blue)
                        .background{Image("button_green")}
                        .font(.custom(applicationFont, size: 30))
                        .padding(.vertical, 25)
                        .padding(.horizontal, 20)
                }
                
            }
    
          
            Button("Start!"){
                playSwitchSound()
                goToGame = true
                
            }.background{Image("button_blue_rectangle")}
                .padding(30)
                .foregroundColor(.white)
                .font(.custom(applicationFont, size: 30))
                .navigationDestination(isPresented: $goToGame){
                    PlayGame(sentTables: includeTables)
                }
                
                
        }//closes nav controller (I think), make navigation modifiers above this line, for some reason.
            .padding()
        
        Text("Unanoonuc 2026 - Beta 1 ")
            .fontWeight(.ultraLight)
            
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
