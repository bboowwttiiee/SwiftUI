//
//  Answer.swift
//  Trivia
//
//  Created by bowtie on 05.07.2022.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
