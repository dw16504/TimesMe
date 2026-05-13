//
//  dataPoint.swift
//  TimesMe
//
//  Created by Douglas Webb on 5/2/26.
//


struct singleQuestion{
    
    var factors: [Int]
    var answerResult = false
    
    var answer : Int {
        
        return factors[0] * factors[1]
    }

}

let wrongOptions = ["Nope!","Not Quite","Try Again", "X"]

let correctOptons  = ["Nice Work!", "Thats right!", "Terrific!", "Like Butter!"]

