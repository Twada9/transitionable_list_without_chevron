//
//  transitionable_list_without_chevronApp.swift
//  transitionable_list_without_chevron
//
//  Created by wada on 2022/09/12.
//

import SwiftUI

@main
struct transitionable_list_without_chevronApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TransitionableListWithoutChevron(deleteAction: nil)
            }
        }
    }
}
