//
//  Array.swift
//  PitView
//
//  Created by Nicolas Guarini on 21/03/24.
//

import Foundation

public extension Array {
    func first(_ count: Int) -> ArraySlice<Element> {
        return self.prefix(count)
    }
    
    func last(_ count: Int) -> ArraySlice<Element> {
        return self.suffix(count)
    }
}
