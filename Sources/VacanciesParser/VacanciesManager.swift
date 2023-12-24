// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

//MARK: - Main entry
public class VacanciesParser {
    private let networkManager = NetworkManager()

    // MARK: - Initializers
    public init() {}

    // MARK: - Public Methods
    public func getIOSVacancies() async -> [ItemVacancy] {
        let vacancies = (try? await networkManager.getVacancies()) ?? []
        let filteredVacancies = vacancies.filter { $0.position?.contains("iOS") ?? false }
        return filteredVacancies
    }
}
