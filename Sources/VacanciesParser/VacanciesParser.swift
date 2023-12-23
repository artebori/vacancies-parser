// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public class VacanciesParser {
    public init() {}
    
    public func testPrint() {
        NetworkManager.shared.getVacancies { str in
            print(str)
        }
    }
}
