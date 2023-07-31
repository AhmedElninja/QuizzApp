//
//  Question.swift
//  Quizz
//
//  Created by Ahmed Alaa on 13/04/2023.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
