//
//  VacanciesService.swift
//
//
//  Created by Артем Соловьев on 23.12.2023.
//

import Foundation

public class VacanciesService {
    
    private var vacancies: [ItemVacancies] = []
   
    private func getVacanciesFromNetwork() async -> [ItemVacancies] {
        return await withCheckedContinuation { cn in
            NetworkManager.shared.getVacanciesFromNetwork { vacancies in
                cn.resume(returning: vacancies)
            }
        }
    }
    
    public func loadVacancies() {
        Task {
            vacancies = await getVacanciesFromNetwork()
        }
    }
    
    public func getVacanciesList() -> [ItemVacancies] {
        vacancies
    }
}
