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
    
    func getVacanciesFromNetwork(completition: @escaping([ItemVacancies]) -> Void) {
        guard let url = baseUrl else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if let data = data {
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
            }
        }
        
        task.resume()
    }
}
