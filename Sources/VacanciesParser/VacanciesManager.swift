// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

//MARK: - Main entry
public class VacanciesParserv {
    
    public init() {}
    
    public func getVacanciesList() async -> [ItemVacancy] {
        var listVacancies: [ItemVacancy] = []
        await NetworkManager.shared.getVacanciesFromNetwork { vacancies in
            let filteredVacancies = vacancies.filter { $0.position?.contains("iOS") ?? false }
            listVacancies = filteredVacancies
        }
        return listVacancies
    }
}
