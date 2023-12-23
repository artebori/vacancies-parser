// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public class VacanciesParser {
    private let service = VacanciesService()
    
    public init() {
        service.loadVacancies()
    }
    
    public func getVacanciesList() -> [ItemVacancies] {
        service.getVacanciesList()
    }
}
