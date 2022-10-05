//
//  ContentView.swift
//  ShapeMorphingAnimation
//
//  Created by bowtie on 19.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MorphingView()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
