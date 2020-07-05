//
//  Grid.swift
//  Memorize
//
//  Created by Roshan sah on 23/06/20.
//  Copyright © 2020 Roshan sah. All rights reserved.
//

import SwiftUI

struct Grid<Item,ItemForView>: View where Item: Identifiable, ItemForView: View {
    private var items: [Item]
    private var viewForItem: (Item) -> ItemForView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemForView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geo in
            self.body(for: GridLayout(itemCount: self.items.count, in: geo.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        return ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(ofMatchingElement: item)
        return Group {
            if index != nil {
                self.viewForItem(item)
                    .frame(width: layout.itemSize.width , height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index!))
            }
        }
    }
}
