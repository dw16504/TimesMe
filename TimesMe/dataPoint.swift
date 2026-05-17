//
//  dataPoint.swift
//  TimesMe
//
//  Created by Douglas Webb on 5/2/26.
//


struct singleQuestion{
    
    var questionID: [Int]
    
    var factors: [Int]
    
    
    var attempts = 0
    var correct = 0
    var incorrect = 0
    var adaptiveDifficulty = 0.0
    
    var incorrectRate: Double {
            guard attempts > 0 else { return 0 }
            return Double(incorrect) / Double(attempts)
        }
    
    var answer : Int {
        
        return factors[0] * factors[1]
    }

}

let wrongOptions = ["Nope!","Not Quite","Try Again", "X"]

let correctOptons  = ["Nice Work!", "Thats right!", "Terrific!", "Like Butter!", "Supper!"]

var masterQuestionSet :[singleQuestion] = []
