// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public class VacanciesParser {
    
    public init() {}
    
    public func getVacanciesFromNetwork() async -> [ItemVacancies] {
        return await withCheckedContinuation { cn in
            NetworkManager.shared.getVacanciesFromNetwork { vacancies in
                cn.resume(returning: vacancies)
            }
        }
    }
}
