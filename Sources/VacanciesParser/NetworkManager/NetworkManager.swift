//
//  NetworkManager.swift
//
//
//  Created by Артем Соловьев on 23.12.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    //TODO: Place the link in the environment
    //MARK: - Base Urls
    private let baseUrl = URL(string: "https://career.raiffeisen.ru/api/vacancy?owner=career")
    
    //MARK: - Url Session
    private let session = URLSession.shared
    
    func getVacanciesFromNetwork(completition: @escaping([ItemVacancy]) -> Void) async {
        guard let url = baseUrl else { return }
            
        do {
            let (data, response) = try await session.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            switch httpResponse.statusCode {
            case 200:
                if let vacancies = try? JSONDecoder().decode(Vacancies.self, from: data) {
                    if !(vacancies.items?.isEmpty ?? false) {
                        completition(vacancies.items ?? [])
                    }
                } else {
                    print("Error of parse JSON")
                }
            default: break
            }
        } catch (var error) {
            print(error.localizedDescription)
        }
    }
}
