//
//  NetworkManager.swift
//
//
//  Created by Артем Соловьев on 23.12.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    //MARK: - Vacancies Items
    private var vacanciesList: [ItemVacancies] = []
    
    //TODO: Place the link in the environment
    //MARK: - Base Urls
    private let baseUrl = URL(string: "https://career.raiffeisen.ru/api/vacancy?owner=career")
    
    //MARK: - Url Session
    private let session = URLSession.shared
    
    private func getVacanciesFromNetwork() async {
        guard let url = baseUrl else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            switch httpResponse.statusCode {
            case 200:
                if let vacancies = try? JSONDecoder().decode(Vacancies.self, from: data) {
                    if !(vacancies.items?.isEmpty ?? false) {
                        vacanciesList = vacancies.items ?? []
                    }
                } else {
                    print("Error of parse JSON")
                }
            default: break
            }
        } catch {
            print("Some error")
        }
    }
    
    func getVacancies() {
        Task {
            await getVacanciesFromNetwork()
        }
    }
    
    func getVacanciesList() -> [ItemVacancies] {
        return vacanciesList
    }
}
