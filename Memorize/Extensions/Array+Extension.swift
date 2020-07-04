//
//  Array+Extension.swift
//  Memorize
//
//  Created by Roshan sah on 04/07/20.
//  Copyright © 2020 Roshan sah. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(ofMatchingElement element: Element) -> Int? {
        let firstIndexOfMatchingElement = self.firstIndex { localElement -> Bool in
            element.id == localElement.id
        }
        return firstIndexOfMatchingElement
    }
}


extension Array {
    var onlyOne: Element? {
        return count == 1 ? first : nil
    }
}
