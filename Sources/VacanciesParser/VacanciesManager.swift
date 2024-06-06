// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public enum CompanyTypeOfVacancies {
    case raiffaisen
    case vk
}

//MARK: - Main entry
public class VacanciesParser {
    private let networkManager = NetworkManager()

    // MARK: - Initializers
    public init() {}

    // MARK: - Public Methods
    public func getIOSVacancies(companyType: CompanyTypeOfVacancies = .raiffaisen) async -> [ItemVacancy] {
        var vacancies: [ItemVacancy] = []
        switch companyType {
        case .raiffaisen:
            vacancies = (try? await networkManager.getRaifaisenVacancies()) ?? []
        case .vk:
            vacancies = (try? await networkManager.getVKVacancies()) ?? []
        }
        let filteredVacancies = vacancies.filter { $0.position?.contains("iOS") ?? false }
        return filteredVacancies
    }
}
