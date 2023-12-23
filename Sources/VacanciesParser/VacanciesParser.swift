// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public class VacanciesParser {
    
    public init() {
        NetworkManager.shared.getVacancies()
    }
    
    public func getVacancies() -> [ItemVacancies] {
        NetworkManager.shared.getVacanciesList()
    }
}
