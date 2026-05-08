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

