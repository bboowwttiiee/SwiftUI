//
//  Extensions.swift
//  LayoutProtocol
//
//  Created by bowtie on 22.12.22.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}
