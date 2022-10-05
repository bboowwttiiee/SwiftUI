//
//  Extensions.swift
//  Trivia
//
//  Created by bowtie on 04.07.2022.
//

import SwiftUI

extension Text {
    func lilacTitle() -> some View {
        self
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
