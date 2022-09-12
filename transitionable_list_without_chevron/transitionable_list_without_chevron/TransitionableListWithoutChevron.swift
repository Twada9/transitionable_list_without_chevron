//
//  ContentView.swift
//  transitionable_list_without_chevron
//
//  Created by wada on 2022/09/12.
//

import SwiftUI

struct TransitionableListWithoutChevron: View {
    let header: AnyView?
    let section: AnyView?
    private let deleteAction: ((IndexSet) -> Void)?

    init(header: AnyView? = nil, section: AnyView? = nil, deleteAction: ((IndexSet) -> Void)?) {
        self.header = header
        self.section = section
        self.deleteAction = deleteAction
    }

    var body: some View {
        List {
            // リストの最上部に一つだけViewを置く。
            header
                .listRowInsets(EdgeInsets())// 余白を消す
            // セクションはコンテンツがなくても余白ができてしまうので分岐
            if let section = section {
                Section(content: {
                    list
                }, header: {
                    section
                        .font(.none)// 自動で太字になるのでデフォルトの太さに
                        .background(Color.white)// デフォルトは灰色なので白に
                        .listRowInsets(EdgeInsets())// 余白を消す
                })
            } else {
                list
            }

        }
        // 余白を削除
        .listStyle(.plain)
    }

    private var list: some View {
        return ForEach(0..<100, id: \.self) { index in
            ZStack {
                NavigationLink(destination: DestinationView()) {
                    Color.clear
                }
                .opacity(0)
                // 表示するセルを置く。
                Text("インデックス: \(index)")
            }
        }
        .if(deleteAction != nil) {
            $0.onDelete(perform: { index in
                deleteAction!(index)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionableListWithoutChevron(header: AnyView(Text("ヘッダー")), section: AnyView(Text("セクション")), deleteAction: { index in

        })
    }
}
