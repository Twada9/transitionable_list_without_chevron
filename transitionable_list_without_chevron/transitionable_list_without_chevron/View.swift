//
//  View.swift
//  transitionable_list_without_chevron
//
//  Created by wada on 2022/09/12.
//

import SwiftUI

extension View {
    /// modifierでif文を使う
    /// - Parameters:
    ///   - conditional: Boolean
    ///   - content: modifier
    @ViewBuilder func `if`<Content: View>(_ conditional: Bool, @ViewBuilder _ content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}
